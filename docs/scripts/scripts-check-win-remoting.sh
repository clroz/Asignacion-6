for p in 22 135 445 5985 5986 3389; do timeout 2 bash -c "</dev/tcp/10.17.45.10/$p" 2>/dev/null && echo "$p OPEN" || echo "$p CLOSED"; done
