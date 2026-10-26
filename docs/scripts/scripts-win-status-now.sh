ps -ef | grep '[q]emu.*Winserver' || true
ss -lntp | grep -E ':30052|:3389|:5985' || true
free -h
