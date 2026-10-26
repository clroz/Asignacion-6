#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
ip route replace default via 10.17.45.254 dev eth1 2>/dev/null || true
apt-get update -qq
apt-get install -y -qq libpam-radius-auth freeradius-utils
printf '10.17.45.10 RadiusLab2026 3\n' > /etc/pam_radius_auth.conf
chmod 600 /etc/pam_radius_auth.conf
cp /etc/pam.d/sshd /etc/pam.d/sshd.bak-a6
grep -q pam_radius_auth /etc/pam.d/sshd || sed -i '/^@include common-auth/i auth [success=1 default=ignore] pam_radius_auth.so' /etc/pam.d/sshd
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh
echo '===PAM==='; grep pam_radius /etc/pam.d/sshd; echo '===PORTS==='; ss -lntp | grep ':22'
