rm -rf /tmp/virtio-drivers
mkdir -p /tmp/virtio-drivers
mount -o loop,ro /opt/qemu/share/qemu/virtio-win-drivers.img /tmp/virtio-drivers
genisoimage -quiet -o /opt/qemu/share/qemu/virtio-win-drivers.iso -R -J /tmp/virtio-drivers
umount /tmp/virtio-drivers
ls -lh /opt/qemu/share/qemu/virtio-win-drivers.iso
