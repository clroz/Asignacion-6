cp '/opt/unetlab/labs/ Tarea Semana 6.unl' '/opt/unetlab/labs/ Tarea Semana 6.unl.bak-ram'
python3 - <<'PY'
p='/opt/unetlab/labs/ Tarea Semana 6.unl'
s=open(p).read()
start=s.find('name="Winserver"')
end=s.find('>',start)
part=s[start:end]
part=part.replace('ram="4096"','ram="3072"')
s=s[:start]+part+s[end:]
open(p,'w').write(s)
print(part)
PY
