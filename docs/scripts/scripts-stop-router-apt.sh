pkill -TERM -f 'apt-get update -qq' || true
sleep 2
pkill -KILL -f '/usr/lib/apt/methods' || true
echo stopped
