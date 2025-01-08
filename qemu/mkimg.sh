#!/bin/bash

# dd if=/dev/zero of=qemu_ubuntu22.04_x86.img bs=1M count=40960
# mkfs.ext4 qemu_ubuntu22.04_x86.img

# qemu-system-x86_64 -m 8G -smp 8 -enable-kvm -boot d -hda qemu_ubuntu22.04_x86.img -cdrom ubuntu-22.04.3-live-server-amd64.iso


# dd if=/dev/zero of=qemu_ubuntu18.04_x86.img bs=1M count=40960
# mkfs.ext4 qemu_ubuntu18.04_x86.img

# qemu-system-x86_64 -m 8G -smp 8 -enable-kvm -boot d -hda qemu_ubuntu18.04_x86.img -cdrom ubuntu-18.04.6-live-server-amd64.iso

qemu-img create -f qcow2 ubuntu18.qcow2 30G

qemu-system-x86_64 -m 8G -smp 8 --enable-kvm -boot d -hda ubuntu18.qcow2 -cdrom ubuntu-18.04.6-live-server-amd64.iso 