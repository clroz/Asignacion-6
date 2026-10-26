echo '=== ROUTER CONTAINER ==='
docker exec docker50 sh -c 'ip -4 -br addr; grep pam_radius /etc/pam.d/sshd; cat /etc/pam_radius_auth.conf; ss -lntp | grep :22'
echo '=== WINDOWS PORTS ==='
for p in 3389 5985; do timeout 2 bash -c "</dev/tcp/10.17.45.10/$p" >/dev/null 2>&1 && echo "$p OPEN" || echo "$p CLOSED"; done
echo '=== MEMORY ==='; free -h
