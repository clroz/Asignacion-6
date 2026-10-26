find /opt/unetlab -path '*8*' -name '*.unl' -o -path '/opt/unetlab/tmp/8/*' -maxdepth 4 2>/dev/null | head -50
find /opt/unetlab/tmp/8 -maxdepth 3 -type f -name '*.json' -o -name '*.cfg' 2>/dev/null | head -50
ip -br link
bridge link | grep -E 'vunl50|vunl51|vunl52|vnet8'
