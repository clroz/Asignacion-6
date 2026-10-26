python3 - <<'PY'
import telnetlib,time
for port,name in [(30050,'ROUTER'),(30051,'SWITCH')]:
 print('=== '+name+' ===')
 t=telnetlib.Telnet('127.0.0.1',port,5)
 t.write(b'\r'); time.sleep(.7)
 print(t.read_very_eager().decode('utf-8','replace'))
 t.close()
import telnetlib,time
t=telnetlib.Telnet('127.0.0.1',30050,5); t.write(b'uname -a; ip -br addr; ip route\r'); time.sleep(1); print('=== ROUTER STATE ==='); print(t.read_very_eager().decode('utf-8','replace')); t.close()
PY
