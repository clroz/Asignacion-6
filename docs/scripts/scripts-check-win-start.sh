ps -ef | grep '/tmp/8/52' | grep qemu | grep -v grep || true
ss -lntp | grep 30052 || true
tail -50 /opt/unetlab/tmp/8/52/wrapper.txt 2>/dev/null || true
