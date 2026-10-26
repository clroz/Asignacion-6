python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);time.sleep(3);t.write(b'\r');time.sleep(1);t.read_very_eager()
for c in [b'configure terminal',b'ip domain name lab.local',b'crypto key generate rsa modulus 2048']:
 t.write(c+b'\r');time.sleep(2);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'yes/no' in s.lower() or 'How many bits' in s:
  t.write(b'2048\r');time.sleep(3);print(t.read_very_eager().decode('utf-8','replace'),end='')
for c in [b'ip ssh version 2',b'end',b'write memory']:
 t.write(c+b'\r');time.sleep(1);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
