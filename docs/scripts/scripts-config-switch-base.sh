python3 - <<'PY'
import telnetlib,time,re
cmds=[
'enable',
'configure terminal',
'hostname SW-A6',
'enable secret EnableSwitch2026!',
'username localadmin privilege 15 secret SwitchLocal2026!',
'interface GigabitEthernet0/0',
'switchport mode access',
'switchport access vlan 1',
'no shutdown',
'exit',
'interface GigabitEthernet0/1',
'switchport mode access',
'switchport access vlan 1',
'no shutdown',
'exit',
'interface Vlan1',
'ip address 192.168.60.2 255.255.255.0',
'no shutdown',
'exit',
'ip default-gateway 192.168.60.1',
'ip domain name lab.local',
'radius server NPS',
'address ipv4 192.168.60.10 auth-port 1812 acct-port 1813',
'key RadiusLab2026!',
'exit',
'aaa new-model',
'aaa authentication login CONSOLE group radius local',
'aaa authorization exec CONSOLE group radius local if-authenticated',
'aaa accounting exec CONSOLE start-stop group radius',
'aaa accounting commands 15 CONSOLE start-stop group radius',
'logging buffered 16384 informational',
'logging userinfo',
'login on-failure log',
'login on-success log',
'line console 0',
'login authentication CONSOLE',
'authorization exec CONSOLE',
'logging synchronous',
'exit',
'line aux 0',
'login authentication CONSOLE',
'authorization exec CONSOLE',
'logging synchronous',
'exit',
'line vty 0 4',
'login local',
'transport input ssh',
'exit',
'ip ssh version 2',
'end',
'write memory'
]
t=telnetlib.Telnet('127.0.0.1',30051,8)
t.write(b'\r');time.sleep(.7);out=t.read_very_eager().decode('utf-8','replace');print(out)
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.35);s=t.read_very_eager().decode('utf-8','replace');print(s,end='')
 if 'yes/no' in s.lower(): t.write(b'yes\r');time.sleep(.5);print(t.read_very_eager().decode('utf-8','replace'),end='')
 t.write(b'\r') if '--More--' in s else None
for c in ['show ip interface brief','show running-config | section aaa','show running-config | section radius','show ip ssh']:
 t.write((c+'\r').encode());time.sleep(1);print('=== '+c+' ===');print(t.read_very_eager().decode('utf-8','replace'))
t.close()
PY
