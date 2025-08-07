#pragma once

#include <stdint.h>

// Will be filled in by the linker script, basically just tells us where the stack starts and ends
// which is useful for identity mapping when trying to set up virtual memory
extern uint32_t __stack_start;
extern uint32_t __stack_end;

// The above but for the text segment
extern uint32_t __text_start;
extern uint32_t __text_end;

// Same for BSS and miscellaneous data
extern uint32_t __misc_start;
extern uint32_t __misc_end;
extern uint32_t  __bss_start;
extern uint32_t __bss_end;
extern uint32_t __results_start;
extern uint32_t __results_end;


// These are just vaddrs not backed by anything physical yet
extern uint64_t __prime_buffer_start;
extern uint64_t __prime_buffer_end;
extern uint64_t __probe_buffer_start;
extern uint64_t __probe_buffer_end;