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

wget -O /usr/bin/autokill https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/autokill.sh
wget -O /usr/bin/banned-user https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/banned-user.sh
wget -O /usr/bin/banner https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/banner.sh
wget -O /usr/bin/delete-user-expire https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/delete-user-expire.sh
wget -O /usr/bin/disable-user-expire https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/disable-user-expire.sh
wget -O /usr/bin/dropmon https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/dropmon.sh
wget -O /usr/bin/menu https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/menu.sh
wget -O /usr/bin/unbanned-user https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/unbanned-user.sh
wget -O /usr/bin/user-active-list https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-active-list.sh
wget -O /usr/bin/user-add https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-add.sh
wget -O /usr/bin/user-add-pptp https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-add-pptp.sh
wget -O /usr/bin/user-del https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-del.sh
wget -O /usr/bin/user-expire-list https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-expire-list.sh
wget -O /usr/bin/user-gen https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-gen.sh
wget -O /usr/bin/user-limit https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-limit.sh
wget -O /usr/bin/user-list https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-list.sh
wget -O /usr/bin/user-login https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-login.sh
wget -O /usr/bin/user-pass https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-pass.sh
wget -O /usr/bin/user-renew https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/user-renew.sh
wget -O /usr/bin/edit-port https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/edit-port.sh
wget -O /usr/bin/edit-port-dropbear https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/edit-port-dropbear.sh
wget -O /usr/bin/edit-port-openssh https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/edit-port-openssh.sh
wget -O /usr/bin/edit-port-squid https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/edit-port-squid.sh
wget -O /usr/bin/edit-port-openvpn https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/edit-port-openvpn.sh
wget -O /usr/bin/benchmark https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/benchmark.sh
wget -O /usr/bin/root-pass https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/root-pass.sh
wget -O /usr/bin/update https://raw.githubusercontent.com/Daphne456/debian_trial/master/update/update.sh

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
