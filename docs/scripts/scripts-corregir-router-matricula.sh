python3 - <<'PY'
import telnetlib,time
cmds=["ip addr del 192.168.60.1/24 dev eth1 2>/dev/null || true","ip addr add 10.17.45.1/24 dev eth1 2>/dev/null || true","ip link set eth1 up","ip -br addr","ip route"]
t=telnetlib.Telnet('127.0.0.1',30050,8);t.write(b'\r');time.sleep(.5);t.read_very_eager()
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.8);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
