cp '/opt/unetlab/labs/ Tarea Semana 6.unl' '/opt/unetlab/labs/ Tarea Semana 6.unl.bak'
python3 - <<'PY'
from pathlib import Path
p=Path('/opt/unetlab/labs/ Tarea Semana 6.unl')
s=p.read_text()
old='-drive file=/opt/qemu/share/qemu/virtio-win-drivers.img,index=1,if=floppy,readonly'
new=old+' -drive file=/opt/qemu/share/qemu/virtio-win-drivers.img,if=ide,media=cdrom,readonly=on'
if new not in s:
 s=s.replace(old,new,1)
 p.write_text(s)
 print('DRIVER_CD_ADDED')
else:
 print('ALREADY_PRESENT')
PY
