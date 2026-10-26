python3 - <<'PY'
import telnetlib,time
cmds=['enable','configure terminal','radius-server host 192.168.60.10 auth-port 1812 acct-port 1813','radius-server key RadiusLab2026','line vty 0 4','login authentication CONSOLE','transport input ssh','exit','end','terminal length 0','crypto key generate rsa general-keys modulus 2048','ip ssh version 2','write memory']
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(.7);s=t.read_very_eager().decode('utf-8','replace')
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.7);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'Password:' in s:t.write(b'EnableSwitch2026\r');time.sleep(.5);print(t.read_very_eager().decode('utf-8','replace'),end='')
 if 'yes/no' in s.lower():t.write(b'yes\r');time.sleep(1);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
