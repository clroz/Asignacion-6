python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(.5);t.read_very_eager();t.write(b'enable\r');time.sleep(.5);s=t.read_very_eager().decode('utf-8','replace');
if 'Password:' in s:t.write(b'EnableSwitch2026\r');time.sleep(.5);t.read_very_eager()
t.write(b'configure terminal\r');time.sleep(.5);t.read_very_eager();
for c in [b'radius-server ?',b'login ?',b'show running-config | include radius|aaa|username|ip ssh|line vty']:
 t.write(c+b'\r');time.sleep(1);print('===',c.decode(),'===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
