#!/usr/bin/env fish

# VM name
vm_name="win10"
export LIBVIRT_DEFAULT_URI="qemu:///system"

virsh start ${vm_name}
virt-viewer -f -w -a ${vm_name}
