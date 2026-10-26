ps -ef | grep '[a]pt\|[d]pkg' || true
dpkg -l libpam-radius-auth freeradius-utils 2>/dev/null || true
grep pam_radius /etc/pam.d/sshd 2>/dev/null || true
