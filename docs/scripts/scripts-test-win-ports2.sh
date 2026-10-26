for p in 3389 5985; do timeout 2 bash -c "</dev/tcp/10.17.45.10/$p" >/dev/null 2>&1 && echo "$p OPEN" || echo "$p CLOSED"; done
