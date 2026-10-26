python3 - <<'PY'
import socket,time,string
sock=socket.socket(socket.AF_UNIX,socket.SOCK_STREAM); sock.settimeout(1)
sock.connect('/opt/unetlab/tmp/8/52/monitor.sock')
time.sleep(.3);sock.recv(4096)
text='New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 10.17.45.10 -PrefixLength 24 -DefaultGateway 10.17.45.1'
mp={**{c:c for c in string.ascii_lowercase},**{str(i):str(i) for i in range(10)},'-':'minus','.':'dot',' ':'spc'}
for c in text.lower():
 sock.sendall(('sendkey '+mp[c]+'\n').encode()); time.sleep(.012)
sock.sendall(b'sendkey ret\n');time.sleep(.5)
try: print(sock.recv(4096).decode('utf-8','replace'))
except: print('KEYS_SENT')
sock.close()
PY
