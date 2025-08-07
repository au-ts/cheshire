#include "regs/cheshire.h"
#include "regs/axi_llc.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "printf.h"
#include <stdint.h>

#include "memory_management/prime_and_probe_symbols.h"
#include "memory_management/riscv_vm.h"
#include "memory_management/frame_alloc.h"
#include "llc_tests.h"

#define DATA_POINTS 16384
#define BUFFER_SIZE PAGE_SIZE * LLC_ASSOCIATIVITY

// This marks the start of free memory on Cheshire, used for allocation
volatile result_t results[DATA_POINTS] SECTION(".results");

static inline void fencet(void) { asm volatile (".word 0xfffff00b" ::: "memory"); }
static inline void sfence(void) { asm volatile("sfence.vma" ::: "memory"); }
static inline void ifence(void) { asm volatile("fence.i" ::: "memory"); }


void touch_llc(uintptr_t buffer, uintptr_t num_sets) {
    for (uintptr_t way = 0; way < LLC_ASSOCIATIVITY; way++) {
        for (uintptr_t set = 0; set < num_sets; set++) {
            volatile uint64_t* line = (volatile uint64_t*)(buffer + way * PAGE_SIZE + set * sizeof(uint64_t));
            volatile uint32_t rv;
            asm volatile("lw %0, 0(%1)" : "=r"(rv) : "r"(line) : "memory");
        }
    }
}


// We jump to this function after entering supervisor mode
int main_continued(void) {
    volatile uint64_t* prime_buffer = (volatile uint64_t*) &__prime_buffer_start;
    volatile uint64_t* probe_buffer = (volatile uint64_t*) &__probe_buffer_start;

    // Try writing to the prime + prob buffers just to test them
    for (size_t way = 0; way < LLC_ASSOCIATIVITY; way++) {
        (prime_buffer + way * 64)[0] = 0xDEADBEEFDEADBEEF + way;
        (probe_buffer + way * 64)[0] = 0xCAFEBABECAFEBABE + way;
    }

    // Read them back out
    for (size_t way = 0; way < LLC_ASSOCIATIVITY; way++) {
        printf("prime_buffer[%zu] = 0x%016lx\r\n", way, (prime_buffer + way * 64)[0]);
        printf("probe_buffer[%zu] = 0x%016lx\r\n", way, (probe_buffer + way * 64)[0]);
    }

    printf("Prime and probe buffers initialized successfully. Staring tests... \r\n");
    for (int i = 0; i < DATA_POINTS; i++) {
        if (i % 1000 == 0) {
            printf("Progress: %d/%d\r\n", i, DATA_POINTS);
        }

        fencet();

        uint32_t secret = random() % 64;
        touch_llc((uintptr_t) &__prime_buffer_start, secret);

        // Perform a "domain switch" which is just a fence.t
        fencet();

        // Now probe the buffer and time how long it takes
        volatile uint32_t cycle_count = rdcycle();
        touch_llc((uintptr_t) &__probe_buffer_start, 64);
        volatile uint32_t elapsed_cycles = rdcycle() - cycle_count;

        results[i].cycle_count = elapsed_cycles;
        results[i].secret = secret;
    }


    // Print the results
    printf("Test completed. Results:\r\n");
    for (int i = 0; i < DATA_POINTS; i++) {
        printf("%u %d\r\n", results[i].secret, results[i].cycle_count);
    }


    while(1) { asm volatile("wfi"); }
}


void trap_vector() {
    uint64_t mcause, mepc, mip, mie, mstatus, mtval, satp;
    asm volatile(
        "csrr %0, mcause; csrr %1, mepc; csrr %2, mip;"
        "csrr %3, mie; csrr %4, mstatus; csrr %5, mtval;"
        "csrr %6, satp"
        : "=r"(mcause), "=r"(mepc), "=r"(mip), "=r"(mie), "=r"(mstatus), "=r"(mtval), "=r"(satp));
    
    printf("\r\n==== [ZSL] trap encountered ====\r\n"
        " mcause:     0x%016x\r\n mepc:       0x%016x\r\n mip:        0x%016x\r\n"
        " mie:        0x%016x\r\n mstatus:    0x%016x\r\n mtval:      0x%016x\r\n"
        "================================\r\n",
        mcause, mepc, mip, mie, mstatus, mtval);
    // Call the page walker and mark the page as accessed
    // mark_page_as_accessed(satp, mtval);
    return;
}


int main() {
    uint32_t stack_start = 0;
    *reg32(&__base_llc, AXI_LLC_CFG_SPM_LOW_REG_OFFSET) = 0b00000000;
    *reg32(&__base_llc, AXI_LLC_COMMIT_CFG_REG_OFFSET) = (1U << AXI_LLC_COMMIT_CFG_COMMIT_BIT);

    printf("Stack starts at %p\r\n", (void*)&__stack_start);
    printf("Stack ends at %p\r\n", (void*)&__stack_end);
    printf("Observed stack start: %p\r\n", (void*)&stack_start);
    printf("Main starts at %p\r\n", (void*)main_continued);
    printf("Prime buffer starts at %p\r\n", (void*)&__prime_buffer_start);
    printf("Probe buffer starts at %p\r\n", (void*)&__probe_buffer_start);

    // Allocate a root page table
    PageTable* root_page_table = RootPageTable(allocate_colour_3_frame());

    // Identity map all the important regions to us
    identity_map_range(root_page_table, (uintptr_t)&__text_start, (uintptr_t)&__text_end, true);
    identity_map_range(root_page_table, (uintptr_t)&__stack_end, (uintptr_t)&__stack_start, false);
    identity_map_range(root_page_table, (uintptr_t)&__base_uart, (uintptr_t)&__base_uart + PAGE_SIZE, false);
    identity_map_range(root_page_table, (uintptr_t)&__base_llc, (uintptr_t)&__base_llc + PAGE_SIZE, false);
    identity_map_range(root_page_table, (uintptr_t)&__misc_start, (uintptr_t)&__misc_end, false);
    identity_map_range(root_page_table, (uintptr_t)&__bss_start, (uintptr_t)&__bss_end, false);
    identity_map_range(root_page_table, (uintptr_t)&__results_start, (uintptr_t)&__results_end, false);

    // Allocate the prime and probe buffers
    allocate_buffer_with_colour(root_page_table, (uintptr_t)&__prime_buffer_start, LLC_ASSOCIATIVITY, 0);
    allocate_buffer_with_colour(root_page_table, (uintptr_t)&__probe_buffer_start, LLC_ASSOCIATIVITY, 1);

    // Write out the root page table to the SATP register
    asm volatile("sfence.vma");
    uint64_t root_ppn = ((uintptr_t)root_page_table >> 12);
    uint64_t satp_value = (((uintptr_t) 8) << 60) | root_ppn;
    asm volatile("csrw satp, %0" :: "r"(satp_value));
    asm volatile ("csrw mcounteren, %0" :: "r"(0x7));

    // Switch to supervisor mode
    unsigned long mstatus;
    asm volatile("csrr %0, mstatus" : "=r"(mstatus));

    // Preserve existing bits, only modify MPP and MPIE
    mstatus &= ~(3UL << 11);    // Clear MPP (bits 12:11)
    mstatus |= (1UL << 11);     // Set MPP = supervisor (01)
    mstatus |= (1UL << 7);      // Set MPIE (bit 7, not bit 5!)

    asm volatile("csrw mstatus, %0" :: "r"(mstatus));
    asm volatile("csrw mepc, %0" :: "r"(main_continued));
    asm volatile("mret");

    return 0;
}