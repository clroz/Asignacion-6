python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30050,8);time.sleep(2);t.write(b'\x03');time.sleep(.5);t.write(b'\r');time.sleep(1);t.write(b'ps -ef | grep -E "apt|dpkg" | grep -v grep; command -v radclient; dpkg -l | grep -E "pam-radius|freeradius"\r');time.sleep(2);print(t.read_very_eager().decode('utf-8','replace'));t.close()
PY
