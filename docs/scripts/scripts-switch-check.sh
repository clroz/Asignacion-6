python3 - <<'PY'
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30051,8);t.write(b'\r');time.sleep(1);print(t.read_very_eager().decode('utf-8','replace'));t.close()
PY
