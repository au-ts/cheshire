#include "regs/cheshire.h"
#include "regs/axi_llc.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "printf.h"
#include <stdint.h>

#include "memory_management/prime_and_probe_symbols.h"
#include "memory_management/frame_alloc.h"
#include "llc_tests.h"

#define DATA_POINTS 8192

// This marks the start of free memory on Cheshire, used for allocation
volatile result_t results[DATA_POINTS] SECTION(".results");

static inline void fencet(void) { asm volatile (".word 0xfffff00b" ::: "memory"); }
static inline void sfence(void) { asm volatile("sfence.vma" ::: "memory"); }
static inline void ifence(void) { asm volatile("fence.i" ::: "memory"); }

void touch_cache_trampling_buffer(volatile char* pages[8], int num_sets) {
    volatile char rv = 0xFF;
    for (int way = 0; way < 8; way++) {
        for (int set = 0; set < num_sets; set++) {
            volatile char* set_line = (volatile char*) (pages[way] + (set * 64));
            rv = *set_line;

            (void) rv;
        }
    }
}

static inline void init_cache_trampling_buffer(volatile char** trampling_buffer, uint32_t colour) {
    for (uint32_t i = 0; i < 8; i++) {
        trampling_buffer[i] = (volatile char*) allocate_frame(colour);
    }
}

int main_continued(void) {
    volatile char* priming_buffer[8];
    volatile char* probing_buffer[8];

    init_cache_trampling_buffer(priming_buffer, 2);
    init_cache_trampling_buffer(probing_buffer, 3);

    for (int way = 0; way < 8; way++) { printf("Priming buffer way %d starts at %p\r\n", way, (void*)priming_buffer[way]); }
    for (int way = 0; way < 8; way++) { printf("Probing buffer way %d starts at %p\r\n", way, (void*)probing_buffer[way]); }

    printf("Prime and probe buffers initialized successfully. Staring tests... \r\n");
    for (int i = 0; i < DATA_POINTS; i++) {
        if (i % 1000 == 0) {
            printf("Progress: %d/%d\r\n", i, DATA_POINTS);
        }

        fencet();

        uint32_t secret = random() % 64;
        touch_cache_trampling_buffer(priming_buffer, secret);

        // Perform a "domain switch" which is just a fence.t
        fencet();

        // Now probe the buffer and time how long it takes
        volatile uint32_t cycle_count = rdcycle();
        touch_cache_trampling_buffer(probing_buffer, 64);
        volatile uint32_t elapsed_cycles = rdcycle() - cycle_count;

        results[i].cycle_count = elapsed_cycles;
        results[i].secret = secret;

        // Prime again to account for the fact that touching the results buffer may have evicted 
        // the probing buffer
        fencet();
        touch_cache_trampling_buffer(probing_buffer, 64);
    }


    // Print the results
    printf("Test completed. Results:\r\n");
    for (int i = 0; i < DATA_POINTS; i++) {
        printf("%u %d\r\n", results[i].secret, results[i].cycle_count);
    }


    while(1) { asm volatile("wfi"); }
}


void verify_range(uintptr_t start, uintptr_t end, uint32_t* expected_colours) {
    for (uintptr_t addr = start; addr < end; addr += PAGE_SIZE) {
        bool valid_colour = expected_colours == 0 || page_colour(addr) == expected_colours[0] || 
                            page_colour(addr) == expected_colours[1];

        if (!valid_colour) {
            printf("Error: Mapped address 0x%lx does not lie in expected colours %d and %d, it lies in colour %d\r\n", addr, expected_colours[0], expected_colours[1], page_colour(addr));
            while (1) {
                // Infinite loop to halt execution
            }
        }
    }
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
    return;
}


int main(void) {
    *reg32(&__base_llc, AXI_LLC_CFG_SPM_LOW_REG_OFFSET) = 0b00000000;
    *reg32(&__base_llc, AXI_LLC_COMMIT_CFG_REG_OFFSET) = (1U << AXI_LLC_COMMIT_CFG_COMMIT_BIT);

    // Verify that everything lies in the correct colours
    uint32_t expected_colours[2] = { 0, 1 };
    verify_range((uintptr_t)&__text_start, (uintptr_t)&__text_end, expected_colours);
    verify_range((uintptr_t)&__stack_end, (uintptr_t)&__stack_start, expected_colours);
    verify_range((uintptr_t)&__base_uart, (uintptr_t)&__base_uart + PAGE_SIZE, NULL);
    verify_range((uintptr_t)&__base_llc, (uintptr_t)&__base_llc + PAGE_SIZE, NULL);
    verify_range((uintptr_t)&__misc_start, (uintptr_t)&__misc_end, expected_colours);
    verify_range((uintptr_t)&__bss_start, (uintptr_t)&__bss_end, expected_colours);
    verify_range((uintptr_t)&__results_start, (uintptr_t)&__results_end, NULL);

    main_continued();
    return 0;
}