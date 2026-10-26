python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(1);print(t.read_very_eager().decode('utf-8','replace'))
for c in [b'end',b'configure terminal',b'radius-server host 192.168.60.10',b'radius-server key RadiusLab2026',b'end',b'write memory']:
 t.write(c+b'\r');time.sleep(1);print('===',c.decode(),'===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
