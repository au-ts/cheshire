/* Copyright 2022 ETH Zurich and University of Bologna. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/* Nicole Narr <narrn@student.ethz.ch> */
/* Christopher Reinwardt <creinwar@student.ethz.ch> */
/* Paul Scheffler <paulsc@iis.ee.ethz.ch> */

INCLUDE common.ldh

SECTIONS {
  __stack_start = ORIGIN(dram) + LENGTH(dram) - 0x2000; /* Bit of a hack but the stack starts at colour 0 (this moves it down to colour 3) */
  __stack_end   = __stack_start - 0x1000; /* Reserve 4KB for the stack (1 page) */
  __stack_pointer$  = __stack_start - 8;

  .text : {
    __text_start = .;
    *(.text._start)
    *(.text)
    *(.text.*)
    __text_end = .;
  } > dram

  .dummy_text : { . = . + 8K; } > dram

  .misc : ALIGN(4K) {
    __misc_start = .;
    *(.rodata)
    *(.rodata.*)
    *(.data)
    *(.data.*)
    *(.srodata)
    *(.srodata.*)
    *(.sdata)
    *(.sdata.*)
    . = ALIGN(4K);
    __misc_end = .;
  } > dram

  .bss : {
    __bss_start = .;
    *(.bss)
    *(.bss.*)
    *(.sbss)
    *(.sbss.*)
    __bss_end = .;
    . = ALIGN(8K);
  } > dram

  .results : ALIGN(16K) {
    __results_start = .;
    *(.results)
    __results_end = .;
  } > dram


  .prime_buffer : ALIGN(16K) {
    __prime_buffer_start = .;
    . = . + 8 * 4K;
    __prime_buffer_end = .;
  } > dram

  .dead_space : ALIGN(16K) {
    . = . + 4 * 4K;
  } > dram

  .probe_buffer : ALIGN(16K) {
    __probe_buffer_start = .;
    . = . + 8 * 4K;
    __probe_buffer_end = .;
  } > dram

  .free_mem : ALIGN(16K) {
    *(.free_mem)
  } > dram
}
