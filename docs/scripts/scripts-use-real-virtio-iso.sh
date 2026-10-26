python3 - <<'PY'
from pathlib import Path
p=Path('/opt/unetlab/labs/ Tarea Semana 6.unl')
s=p.read_text()
for x in [
 ' -drive file=/opt/qemu/share/qemu/virtio-win-drivers.img,if=floppy,readonly',
 ' -drive file=/opt/qemu/share/qemu/virtio-win-drivers.iso,if=ide,media=cdrom,readonly=on',
 ' -drive file=/opt/qemu/share/qemu/virtio-win-drivers.iso,if=ide,index=2,media=cdrom,readonly=on']:
 s=s.replace(x,'')
needle=' -boot order=dc'
add=' -drive file=/opt/unetlab/addons/qemu/winserver-2022/virtio-win.iso,if=ide,index=3,media=cdrom,readonly=on'
if add not in s:s=s.replace(needle,needle+add,1)
p.write_text(s)
print('REAL_VIRTIO_ISO_CONFIGURED')
PY
