#!/bin/bash
echo '=== PROCESO WIN ==='
ps -ef | grep '[q]emu.*Winserver' || true
echo '=== CONSOLA/VNC ==='
ss -lntp | grep -E ':30052|:590' || true
echo '=== TMP ==='
ls -lah /opt/unetlab/tmp/8/52 2>/dev/null || true
echo '=== LAB ==='
grep -o 'Winserver[^<]*' '/opt/unetlab/labs/ Tarea Semana 6.unl' 2>/dev/null || true
