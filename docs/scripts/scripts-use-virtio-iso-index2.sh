python3 - <<'PY'
from pathlib import Path
p=Path('/opt/unetlab/labs/ Tarea Semana 6.unl')
s=p.read_text().replace('-drive file=/opt/qemu/share/qemu/virtio-win-drivers.iso,if=ide,media=cdrom,readonly=on','-drive file=/opt/qemu/share/qemu/virtio-win-drivers.iso,if=ide,index=2,media=cdrom,readonly=on')
p.write_text(s)
print('VIRTIO_ISO_INDEX2_CONFIGURED')
PY
