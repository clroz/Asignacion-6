ip addr add 10.17.45.254/24 dev vnet8_1 2>/dev/null || true
ip -br addr show vnet8_1
ping -c 3 -W 2 10.17.45.10 || true
timeout 5 bash -c '</dev/tcp/10.17.45.10/3389' 2>/dev/null && echo RDP_OPEN || echo RDP_CLOSED
