python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30050,5)
t.write(b'command -v sshd; command -v radclient; ip -br addr; cat /etc/os-release\r');time.sleep(1)
print(t.read_very_eager().decode('utf-8','replace'));t.close()
PY
