printf 'system_powerdown\n' | timeout 3 nc -U /opt/unetlab/tmp/8/52/monitor.sock || true
sleep 5
cp '/opt/unetlab/labs/ Tarea Semana 6.unl' '/opt/unetlab/labs/ Tarea Semana 6.unl.bak-boot'
sed -i 's/-boot order=dc/-boot order=c/' '/opt/unetlab/labs/ Tarea Semana 6.unl'
echo BOOT_FIXED
