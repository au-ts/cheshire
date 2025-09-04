// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>

.section .text._start

// Minimal CRT0
.global _start
.align 4
_start:
    j 2f
1:
    wfi
    j 1b
2:
    // Init stack and global pointer iff linked as nonzero
    mv t1, sp
    la t0, __stack_pointer$
    beqz t0, 1f
    mv sp, t0
1:  .option push
    .option norelax
    la t0, __global_pointer$
    beqz t0, 1f
    mv gp, t0
1:  .option pop

    // Store existing stack, global, return pointers on new stack
    addi sp, sp, -24
    sd t1, 0(sp)
    sd gp, 8(sp)
    sd ra, 16(sp)

    // Set trap vector
    la t0, _trap_handler_wrap
    csrrw x0, stvec, t0

    // Zero the .bss section
    la t0, __bss_start      // t0 = bss start address
    la t1, __bss_end        // t1 = bss end address
    sub t2, t1, t0          // t2 = #bytes to zero
    li a0, 0

_zero_bss_loop:
    addi t4, t2, -32
    blez t2, _fp_init           // t2 <= 0? => No bss to zero
    blt t4, x0, _zero_bss_rem   // t4 <  0? => Less than 4 words left
    sd a0, 0(t0)
    sd a0, 8(t0)
    sd a0, 16(t0)
    sd a0, 24(t0)
    addi t2, t2, -32
    addi t0, t0, 32
    bgt t2, x0, _zero_bss_loop  // Still more to go
    j _fp_init

_zero_bss_rem:
    sb a0, 0(t0)
    addi t2, t2, -1
    addi t0, t0, 1
    bgt t2, x0, _zero_bss_rem

_fp_init:
    // Full fence, then jump to main
    fence
    call main

// If main returns, we end up here
.global _exit
.align 4
_exit:
    // Restore the original context registers (sp last)
    ld ra, 16(sp)
    ld gp, 8(sp)
    ld sp, 0(sp)
    // Save the return value to scratch register 2 and wait forever.
    slli t0, a0, 1
    ori  t0, t0, 1
    la t1, __base_regs
    sw t0, 8(t1)     // regs.SCRATCH[2]
    // Hand over to whatever called us, passing return
    ret

// This wraps the C trap handler to save the (integer-only) caller-save
// registers and perform a proper machine-mode exception return.
.align 4
_trap_handler_wrap:
    addi sp, sp, -128
    sd ra, 120(sp)
    sd t0, 112(sp)
    sd t1, 104(sp)
    sd t2, 96(sp)
    sd a0, 88(sp)
    sd a1, 80(sp)
    sd a2, 72(sp)
    sd a3, 64(sp)
    sd a4, 56(sp)
    sd a5, 48(sp)
    sd a6, 40(sp)
    sd a7, 32(sp)
    sd t3, 24(sp)
    sd t4, 16(sp)
    sd t5, 8(sp)
    sd t6, 0(sp)

    jal trap_vector

    ld ra, 120(sp)
    ld t0, 112(sp)
    ld t1, 104(sp)
    ld t2, 96(sp)
    ld a0, 88(sp)
    ld a1, 80(sp)
    ld a2, 72(sp)
    ld a3, 64(sp)
    ld a4, 56(sp)
    ld a5, 48(sp)
    ld a6, 40(sp)
    ld a7, 32(sp)
    ld t3, 24(sp)
    ld t4, 16(sp)
    ld t5, 8(sp)
    ld t6, 0(sp)
    addi sp, sp, 128
    mret

.global trap_vector
.weak trap_vector
.align 4