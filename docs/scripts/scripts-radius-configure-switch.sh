python3 - <<'PY'
import telnetlib,time
cmds=['aaa group server radius NPS','server-private 10.17.45.10 auth-port 1812 acct-port 1813 key RadiusLab2026','exit','aaa authentication login CONSOLE group NPS local','aaa authorization exec CONSOLE group NPS local if-authenticated','aaa accounting exec CONSOLE start-stop group NPS','end','write memory']
t=telnetlib.Telnet('127.0.0.1',30051,8);time.sleep(3);t.write(b'\r');time.sleep(1);t.read_very_eager()
for c in cmds:
 t.write((c+'\r').encode());time.sleep(.8);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
