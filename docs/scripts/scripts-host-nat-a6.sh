sysctl -w net.ipv4.ip_forward=1
iptables -C FORWARD -i vnet8_1 -o pnet0 -j ACCEPT 2>/dev/null || iptables -A FORWARD -i vnet8_1 -o pnet0 -j ACCEPT
iptables -C FORWARD -i pnet0 -o vnet8_1 -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null || iptables -A FORWARD -i pnet0 -o vnet8_1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -C POSTROUTING -s 10.17.45.0/24 -o pnet0 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -s 10.17.45.0/24 -o pnet0 -j MASQUERADE
echo NAT_READY
