python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8)
t.write(b'\r');time.sleep(2);out=t.read_very_eager().decode('utf-8','replace');print(out)
for c in [b'enable',b'EnableSwitch2026',b'terminal length 0',b'show ip interface brief',b'show running-config | section aaa',b'show running-config | section line con',b'show running-config | section line vty']:
 t.write(c+b'\r');time.sleep(1);s=t.read_very_eager().decode('utf-8','replace');print('=== '+c.decode()+' ===');print(s)
t.close()
PY
