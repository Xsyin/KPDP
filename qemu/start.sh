#!/bin/bash

# qemu-system-x86_64 -m 4096 -smp 4 -nographic -enable-kvm -hda qemu_ubuntu22.04_x86.img -net user,hostfwd=tcp::10022-:22 -net nic
#qemu-system-x86_64 -m 16G -smp 8  -enable-kvm -hda qemu_ubuntu18.04_x86.img -net user,hostfwd=tcp::10022-:22 -net nic
# qemu-system-x86_64  -m 16G -smp 8 -enable-kvm -drive file=ubuntu22.04.qcow2,format=qcow2 -net user,hostfwd=tcp::10022-:22 -net nic
qemu-system-x86_64 -m 8G -smp 4  -enable-kvm -hda qemu_ubuntu18.04_x86.img -net user,hostfwd=tcp::10023-:22 -net nic

