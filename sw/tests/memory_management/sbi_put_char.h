#pragma once

#define SBI_CONSOLE_PUTCHAR 1
#define SBI_CONSOLE_GETCHAR 2

// Legacy SBI call (don't use in new code)
static inline long sbi_call_legacy(long which, long arg0, long arg1, long arg2) {
    register long a0 asm("a0") = arg0;
    register long a1 asm("a1") = arg1;
    register long a2 asm("a2") = arg2;
    register long a7 asm("a7") = which;
    
    asm volatile("ecall" : "+r"(a0) : "r"(a1), "r"(a2), "r"(a7) : "memory");
    return a0;
}

void legacy_sbi_putchar(int ch) {
    sbi_call_legacy(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
}