free -h
uptime
ps -eo pid,comm,%cpu,%mem,rss,args --sort=-%cpu | head -12
