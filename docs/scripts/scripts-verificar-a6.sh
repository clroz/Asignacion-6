python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);time.sleep(3);t.write(b'\r');time.sleep(1);t.read_very_eager()
for c in [b'terminal length 0',b'show ip interface brief',b'show running-config | section aaa',b'show running-config | section radius',b'show ip ssh',b'show running-config | section line vty']:
 t.write(c+b'\r');time.sleep(1.5);print('=== '+c.decode()+' ===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
