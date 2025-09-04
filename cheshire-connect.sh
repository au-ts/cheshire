target extended-remote localhost:3333
monitor reset halt

restore prime_and_probe_channel.spm_llc_tests.elf

add-symbol-file prime_and_probe_channel.spm_llc_tests.elf
add-symbol-file fw_jump.elf

set $a0 = 0
set $a1 = 0
load fw_jump.elf

c