python3 - <<'PY'
import telnetlib,time
cmds=[
"ip route add default via 10.177.0.1 dev eth0 2>/dev/null || true",
"apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq libpam-radius-auth freeradius-utils",
"printf '10.17.45.10 RadiusLab2026 3\\n' > /etc/pam_radius_auth.conf",
"chmod 600 /etc/pam_radius_auth.conf",
"grep -q pam_radius_auth /etc/pam.d/sshd || sed -i '/^@include common-auth/i auth [success=1 default=ignore] pam_radius_auth.so' /etc/pam.d/sshd",
"grep -q 'authpriv.* /var/log/auth.log' /etc/rsyslog.conf || printf '\nauthpriv.* /var/log/auth.log\\n' >> /etc/rsyslog.conf",
"sshd -t && service ssh restart",
"grep -n pam_radius_auth /etc/pam.d/sshd; cat /etc/pam_radius_auth.conf; ss -lntp | grep ':22' || true"
]
t=telnetlib.Telnet('127.0.0.1',30050,8);t.write(b'\r');time.sleep(.5);t.read_very_eager()
for c in cmds:
 t.write((c+'\r').encode());time.sleep(2);print(t.read_very_eager().decode('utf-8','replace'),end='')
t.close()
PY
