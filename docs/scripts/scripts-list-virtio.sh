mkdir -p /tmp/vcheck
mount -o loop,ro /opt/qemu/share/qemu/virtio-win-drivers.img /tmp/vcheck 2>/dev/null || true
find /tmp/vcheck -maxdepth 5 -type f | head -100
umount /tmp/vcheck 2>/dev/null || true
find /opt/unetlab/addons/qemu -iname '*virtio*' -o -iname '*driver*' | head -100
