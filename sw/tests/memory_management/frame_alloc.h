#pragma once

#include <stdint.h>
#include "printf.h"

#include "riscv_vm.h"

#define SECTION(name) __attribute__((__section__(name)))
#define PAGE_SIZE 4096

volatile uint8_t  free_memory SECTION(".free_mem");
volatile void* free_coloured_frames[4] = {
    &free_memory,
    &free_memory + PAGE_SIZE,
    &free_memory + 2 * PAGE_SIZE,
    &free_memory + 3 * PAGE_SIZE
};

static inline uint32_t page_colour(uintptr_t addr) {
    return (addr & ((1UL << 12) | (1UL << 13))) >> 12;
}

// Allocates a frame of a given colour from the free memory section
void* allocate_frame(uint32_t colour) {
    volatile void* frame = free_coloured_frames[colour];
    free_coloured_frames[colour] += 4 * PAGE_SIZE;

    if (page_colour((uintptr_t) frame) != colour) {
        printf("Error: Allocated frame does not match requested colour...\r\n");
        printf("Frame address: %p, Colour: %d\r\n", frame, page_colour((uintptr_t)frame));
        while (1) {
        }
    }

    // zero out the frame
    for (int i = 0; i < PAGE_SIZE; i++) {
        ((volatile uint8_t*)frame)[i] = 0;
    }

    return (void*) frame;
}

void* allocate_colour_1_frame() {
    void* frame = allocate_frame(1);
    return frame;
}

// Identity maps the range [start, end) into the page table
void identity_map_range(PageTable* table, uintptr_t start, uintptr_t end, bool is_executable, uint32_t* expected_colours) {
    printf("Begining mapping\r\n");
    for (uintptr_t addr = start; addr < end; addr += PAGE_SIZE) {
        map_page(table, addr, addr, is_executable, allocate_colour_1_frame);

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

void allocate_buffer_with_colour(PageTable* table, uintptr_t buffer_vaddr, size_t np, int colour) {
    for (size_t i = 0; i < np; i++) {
        uintptr_t vaddr = (uintptr_t)(buffer_vaddr + i * PAGE_SIZE);
        uintptr_t paddr = (uintptr_t) allocate_frame(colour);

        printf("Allocating page at vaddr: 0x%lx, paddr: 0x%lx, colour: %d\r\n", vaddr, paddr, colour);

        // Insert the page into the page table but use colour 1 for intermediate page tables
        map_page(table, vaddr, paddr, false, allocate_colour_1_frame);
    }
}