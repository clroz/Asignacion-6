python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(.5);t.read_very_eager();
for c in [b'end',b'configure terminal',b'terminal length 0',b'radius-server ?']:
 t.write(c+b'\r');time.sleep(.8);print('===',c.decode(),'===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
