python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);time.sleep(3);t.write(b'\r');time.sleep(1);t.read_very_eager();
for c in [b'configure terminal',b'radius-server host ?']:
 t.write(c+b'\r');time.sleep(1);print('===',c.decode(),'===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
