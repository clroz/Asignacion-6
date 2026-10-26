ps -ef | grep '/opt/qemu' | grep '/tmp/8/' | grep -v grep
ps -ef | grep 'docker_wrapper' | grep -v grep
ss -lntp | grep -E ':3005[0-9]|:3006[0-9]'
