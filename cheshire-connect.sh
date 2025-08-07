target extended-remote localhost:3333
monitor reset halt
load prime_and_probe_channel.spm_llc_tests.elf
set $a0 = 0
# ensure this is 0 so that whatever garbage leftover is not treated as a DTB.
set $a1 = 0
add-symbol-file prime_and_probe_channel.spm_llc_tests.elf
c
