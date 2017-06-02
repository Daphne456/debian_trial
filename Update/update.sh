#!/bin/bash

grep "iptables -A INPUT -m string --algo kmp --string sonyentertainmentnetwork -j REJECT" /etc/rc.local > /dev/null
if [[ $? != 0 ]];then
	sed -i "1 a\iptables -A INPUT -m string --algo kmp --string sonyentertainmentnetwork -j REJECT" /etc/rc.local
fi

grep "iptables -A FORWARD -m string --algo kmp --string sonyentertainmentnetwork -j REJECT" /etc/rc.local > /dev/null
if [[ $? != 0 ]];then
	sed -i "1 a\iptables -A FORWARD -m string --algo kmp --string sonyentertainmentnetwork -j REJECT" /etc/rc.local
fi

grep "iptables -A INPUT -m string --algo kmp --string playstation -j REJECT" /etc/rc.local > /dev/null
if [[ $? != 0 ]];then
	sed -i "1 a\iptables -A INPUT -m string --algo kmp --string playstation -j REJECT" /etc/rc.local
fi

grep "iptables -A FORWARD -m string --algo kmp --string playstation -j REJECT" /etc/rc.local > /dev/null
if [[ $? != 0 ]];then
	sed -i "1 a\iptables -A FORWARD -m string --algo kmp --string playstation -j REJECT" /etc/rc.local
fi

wget -O /usr/bin/autokill http://anekascript.anekavps.us/Debian7/autokill
wget -O /usr/bin/banned-user http://anekascript.anekavps.us/Debian7/banned-user
wget -O /usr/bin/banner http://anekascript.anekavps.us/Debian7/banner
wget -O /usr/bin/delete-user-expire http://anekascript.anekavps.us/Debian7/delete-user-expire
wget -O /usr/bin/disable-user-expire http://anekascript.anekavps.us/Debian7/disable-user-expire
wget -O /usr/bin/dropmon http://anekascript.anekavps.us/Debian7/dropmon
wget -O /usr/bin/menu http://anekascript.anekavps.us/Debian7/menu
wget -O /usr/bin/unbanned-user http://anekascript.anekavps.us/Debian7/unbanned-user
wget -O /usr/bin/user-active-list http://anekascript.anekavps.us/Debian7/user-active-list
wget -O /usr/bin/user-add http://anekascript.anekavps.us/Debian7/user-add
wget -O /usr/bin/user-add-pptp http://anekascript.anekavps.us/Debian7/user-add-pptp
wget -O /usr/bin/user-del http://anekascript.anekavps.us/Debian7/user-del
wget -O /usr/bin/user-expire-list http://anekascript.anekavps.us/Debian7/user-expire-list
wget -O /usr/bin/user-gen http://anekascript.anekavps.us/Debian7/user-gen
wget -O /usr/bin/user-limit http://anekascript.anekavps.us/Debian7/user-limit
wget -O /usr/bin/user-list http://anekascript.anekavps.us/Debian7/user-list
wget -O /usr/bin/user-login http://anekascript.anekavps.us/Debian7/user-login
wget -O /usr/bin/user-pass http://anekascript.anekavps.us/Debian7/user-pass
wget -O /usr/bin/user-renew http://anekascript.anekavps.us/Debian7/user-renew
wget -O /usr/bin/edit-port http://anekascript.anekavps.us/Debian7/edit-port
wget -O /usr/bin/edit-port-dropbear http://anekascript.anekavps.us/Debian7/edit-port-dropbear
wget -O /usr/bin/edit-port-openssh http://anekascript.anekavps.us/Debian7/edit-port-openssh
wget -O /usr/bin/edit-port-squid http://anekascript.anekavps.us/Debian7/edit-port-squid
wget -O /usr/bin/edit-port-openvpn http://anekascript.anekavps.us/Debian7/edit-port-openvpn
wget -O /usr/bin/benchmark http://anekascript.anekavps.us/Debian7/benchmark.sh
wget -O /usr/bin/root-pass http://anekascript.anekavps.us/Debian7/root-pass
wget -O /usr/bin/update http://anekascript.anekavps.us/Debian7/update

chmod +x /usr/bin/autokill
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/banner
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/edit-port
chmod +x /usr/bin/edit-port-dropbear
chmod +x /usr/bin/edit-port-openssh
chmod +x /usr/bin/edit-port-squid
chmod +x /usr/bin/edit-port-openvpn
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/root-pass
chmod +x /usr/bin/update
