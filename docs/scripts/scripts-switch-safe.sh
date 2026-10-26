python3 - <<'PY'
import telnetlib,time
cmds=[
'enable','configure terminal','hostname SW-A6',
'enable secret EnableSwitch2026',
'username localadmin privilege 15 secret SwitchLocal2026',
'interface GigabitEthernet0/0','switchport mode access','switchport access vlan 1','no shutdown','exit',
'interface GigabitEthernet0/1','switchport mode access','switchport access vlan 1','no shutdown','exit',
'interface Vlan1','ip address 192.168.60.2 255.255.255.0','no shutdown','exit','ip default-gateway 192.168.60.1',
'ip domain name lab.local',
'radius-server host 192.168.60.10 auth-port 1812 acct-port 1813 key RadiusLab2026',
'aaa new-model','aaa authentication login CONSOLE group radius local','aaa authorization exec CONSOLE group radius local if-authenticated','aaa authorization console','aaa accounting exec CONSOLE start-stop group radius',
'logging buffered 16384 informational','logging userinfo','login on-failure log','login on-success log',
'line console 0','login authentication CONSOLE','authorization exec CONSOLE','logging synchronous','exit',
'line aux 0','login authentication CONSOLE','authorization exec CONSOLE','logging synchronous','exit',
'line vty 0 4','login local','transport input ssh','exit','ip ssh version 2','end','write memory']
t=telnetlib.Telnet('127.0.0.1',30051,8)
t.write(b'\r');time.sleep(.8);print(t.read_very_eager().decode('utf-8','replace'))
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.4);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'Password:' in s:
  t.write(b'EnableSwitch2026\r');time.sleep(.5);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
