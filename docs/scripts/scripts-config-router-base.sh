python3 - <<'PY'
import telnetlib,time
cmds=[
"ip addr add 192.168.60.1/24 dev eth1 2>/dev/null || true",
"ip link set eth1 up",
"sysctl -w net.ipv4.ip_forward=1",
"id netadmin >/dev/null 2>&1 || useradd -m -s /bin/bash netadmin",
"echo 'netadmin:LabNet2026!' | chpasswd",
"sed -i 's/^#\\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config",
"sed -i 's/^#\\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config",
"printf '\\nAllowUsers netadmin\\nLogLevel VERBOSE\\n' >> /etc/ssh/sshd_config",
"sshd -t && service ssh restart",
"ip -br addr; ip route; ss -lntp | grep ':22' || true"
]
t=telnetlib.Telnet('127.0.0.1',30050,8)
t.write(b'\r');time.sleep(.5);t.read_very_eager()
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.7);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY

