#ifndef LLC_TESTS_H
#define LLC_TESTS_H

#include <stdint.h>

#define SHARED_DATA_NUMBER_WAYS 1
#define SHARED_DATA_NUMBER_LINES 128

#define LLC_WAY_NUM_LINES 256
#define LLC_ACTIVE_NUM_WAYS 1
#define LLC_ASSOCIATIVITY 8

typedef struct { uint32_t cycle_count; uint32_t secret; } result_t;

static inline uint32_t rdcycle() {
    volatile uint32_t rv;
    asm volatile ("rdcycle %0": "=r" (rv) ::);
    return rv;
}

uint32_t random(void) {
    static uint32_t state = 0xACE1ACE1;

    /* LFSR with taps are 31, 21, 1, 0*/
    uint32_t bit0 = (state >> 0) & 1;
    uint32_t bit1 = (state >> 1) & 1;
    uint32_t bit2 = (state >> 21) & 1;
    uint32_t bit3 = (state >> 31) & 1;

    uint32_t feedback = bit3 ^ bit2 ^ bit1 ^ bit0;

    state = ((state << 1) | feedback) & 0xFFFFFFFF;

    return state;
}


#endif // LLC_TESTS_H