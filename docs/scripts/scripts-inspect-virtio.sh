file /opt/qemu/share/qemu/virtio-win-drivers.img
fdisk -l /opt/qemu/share/qemu/virtio-win-drivers.img 2>/dev/null || true
command -v genisoimage || command -v mkisofs || true
