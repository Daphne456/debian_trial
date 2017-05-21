#!/bin/bash

#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="http://anekascript.anekavps.us"
fi

wget -O /usr/bin/dropmon $source/Debian7/dropmon.sh
wget -O /usr/bin/menu $source/Debian7/menu.sh
wget -O /usr/bin/user-active-list $source/Debian7/user-active-list.sh
wget -O /usr/bin/user-add $source/Debian7/user-add.sh
wget -O /usr/bin/user-add-pptp $source/Debian7/user-add-pptp.sh
wget -O /usr/bin/user-del $source/Debian7/user-del.sh
wget -O /usr/bin/disable-user-expire $source/Debian7/disable-user-expire.sh
wget -O /usr/bin/delete-user-expire $source/Debian7/delete-user-expire.sh
wget -O /usr/bin/banned-user $source/Debian7/banned-user.sh
wget -O /usr/bin/unbanned-user $source/Debian7/unbanned-user.sh
wget -O /usr/bin/user-expire-list $source/Debian7/user-expire-list.sh
wget -O /usr/bin/user-gen $source/Debian7/user-gen.sh
wget -O /usr/bin/user-limit $source/Debian7/user-limit.sh
wget -O /usr/bin/user-list $source/Debian7/user-list.sh
wget -O /usr/bin/user-login $source/Debian7/user-login.sh
wget -O /usr/bin/user-pass $source/Debian7/user-pass.sh
wget -O /usr/bin/user-renew $source/Debian7/user-renew.sh
wget -O /usr/bin/autokill $source/Debian7/autokill.sh

chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/autokill
