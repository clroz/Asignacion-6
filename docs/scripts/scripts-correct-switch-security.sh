python3 - <<'PY'
import telnetlib,time
cmds=[
'enable','configure terminal',
'radius-server host 192.168.60.10 auth-port 1812 acct-port 1813 key RadiusLab2026!',
'aaa new-model',
'aaa authentication login CONSOLE group radius local',
'aaa authorization exec CONSOLE group radius local if-authenticated',
'aaa accounting exec CONSOLE start-stop group radius',
'aaa accounting commands 15 CONSOLE start-stop group radius',
'logging buffered 16384 informational',
'logging userinfo',
'login on-failure log',
'login on-success log',
'line console 0','login authentication CONSOLE','authorization exec CONSOLE','logging synchronous','exit',
'line aux 0','login authentication CONSOLE','authorization exec CONSOLE','logging synchronous','exit',
'line vty 0 4','login local','transport input ssh','exit',
'crypto key generate rsa modulus 2048','ip ssh version 2',
'end','write memory']
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(.8);print(t.read_very_eager().decode('utf-8','replace'))
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.45);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'Password:' in s:
  t.write(b'EnableSwitch2026!\r');time.sleep(.5);print(t.read_very_eager().decode('utf-8','replace'),end='')
 if 'yes/no' in s.lower():t.write(b'yes\r');time.sleep(.6);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
