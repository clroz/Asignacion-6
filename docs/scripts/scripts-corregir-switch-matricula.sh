python3 - <<'PY'
import telnetlib,time
cmds=['configure terminal','interface Vlan1','ip address 10.17.45.2 255.255.255.0','no shutdown','exit','ip default-gateway 10.17.45.1','radius-server host 10.17.45.10','radius-server key RadiusLab2026','end','write memory']
t=telnetlib.Telnet('127.0.0.1',30051,8);time.sleep(4);t.write(b'\r');time.sleep(1);print(t.read_very_eager().decode('utf-8','replace'))
for c in cmds:
 t.write((c+'\r').encode());time.sleep(1);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'Password:' in s:t.write(b'EnableSwitch2026\r');time.sleep(.7);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
