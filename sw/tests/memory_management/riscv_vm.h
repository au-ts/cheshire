#pragma once

#include "printf.h"
#include <stdint.h>

#define true 1
#define false 0

typedef struct {
    uint64_t v    : 1;   // [0] Valid bit
    uint64_t r    : 1;   // [1] Read permission
    uint64_t w    : 1;   // [2] Write permission  
    uint64_t x    : 1;   // [3] Execute permission
    uint64_t u    : 1;   // [4] User mode accessible
    uint64_t g    : 1;   // [5] Global mapping
    uint64_t a    : 1;   // [6] Accessed bit
    uint64_t d    : 1;   // [7] Dirty bit
    uint64_t rsw  : 2;   // [9:8] Reserved for supervisor software
    uint64_t ppn  : 44;  // [53:10] Physical Page Number
    uint64_t rsvd : 10;  // [63:54] Reserved (must be zero)
} __attribute__((packed)) PageTableEntry;
static_assert(sizeof(PageTableEntry) == 8, "PageTableEntry must be 8 bytes");

typedef struct {
    PageTableEntry entries[512];
} PageTable;
static_assert(sizeof(PageTable) == 4096, "PageTable must be 4096 bytes (4KB)");


// Mostly a function for testing purposes
void mark_page_as_accessed(uint64_t satp, uint64_t vaddr) {
    // Extract root page table PPN from satp
    uint64_t root_ppn = satp & 0xFFFFFFFFFFF;
    PageTable* pt = (PageTable*)(root_ppn << 12);

    // printf("Walking page table for VA: 0x%lx\r\n", vaddr);

    uintptr_t vpn[3] = { vaddr >> 12 & 0x1FF, vaddr >> 21 & 0x1FF, vaddr >> 30 & 0x1FF };
    PageTableEntry* pte = &pt->entries[vpn[2]];

    for (int i = 1; i >= 0; i--) {
        if (!pte->v) {
            printf("Error: Page table entry not valid at VPN[%d]: %lu\r\n", i, vpn[i]);
            while (1) {
                // Infinite loop to halt execution
            }
        }

        // Get the next PageTableEntry to work with
        PageTable* next_table = (PageTable*)(((uintptr_t) pte->ppn << (uintptr_t) 12));
        PageTableEntry* next_pte = &next_table->entries[vpn[i]];
        pte = next_pte;
    }

    if (!pte->v) {
        printf("Error: Leaf page table entry not valid for vaddr: 0x%lx\r\n", vaddr);
        while (1) {
            // Infinite loop to halt execution
        }
    }

    // Print metadata about the page
    // printf("Page metadata for vaddr 0x%lx:\r\n", vaddr);
    // printf("  Valid: %d, Read: %d, Write: %d, Execute: %d\r\n", pte->v, pte->r, pte->w, pte->x);
    // printf("  Accessed: %d, Dirty: %d\r\n", pte->a, pte->d);

    pte->a = 1;
    pte->d = 1;
    asm volatile("sfence.vma");
}

void map_page(PageTable* table, uintptr_t vaddr, uintptr_t paddr, bool is_executable, void* (*allocate_page_table)()) {
    // First decompose the vaddr into its VPN components
    uintptr_t vpn[3] = { vaddr >> 12 & 0x1FF, vaddr >> 21 & 0x1FF, vaddr >> 30 & 0x1FF };
    PageTableEntry* pte = &table->entries[vpn[2]];

    // Print the VPN for debugging
    // for (int i = 2; i >= 0; i--) {
    //     printf("mapping: VPN[%d]: %lu\n", i, vpn[i]);
    // }

    for (int i = 1; i >= 0; i--) {
        if (!pte->v) {
            PageTable* new_table = (PageTable*) allocate_page_table();
            if (((uintptr_t)new_table & 0xFFF) != 0) {
                printf("Error: Allocated page table is not aligned to 4KB boundary.\r\n");
                printf("Address is %p\r\n", new_table);
                while (1) {
                    // Infinite loop to halt execution
                }
            }

            pte->ppn = ((uintptr_t)new_table >> 12);
            pte->v = 1;
            // printf("Allocated new page table at %p for VPN[%d]: %lu\n", new_table, i, vpn[i]);
        }

        // Get the next PageTableEntry to work with
        PageTable* next_table = (PageTable*)(((uintptr_t) pte->ppn << (uintptr_t) 12));
        PageTableEntry* next_pte = &next_table->entries[vpn[i]];
        pte = next_pte;
    }

    // We are now at the leaf level, set the final entry
    // the entry is marked as a leaf based on the permission bits
    pte->ppn = paddr >> 12;
    pte->v = 1;
    pte->r = 1;
    pte->w = 1;
    pte->a = 1;
    pte->d = 1; // Not dirty yet
    pte->x = is_executable;
}

#define RootPageTable(x) ((PageTable*)x)