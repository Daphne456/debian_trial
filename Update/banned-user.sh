#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="https://raw.githubusercontent.com/Daphne456/debian_trial/master/update"
fi

# go to root
cd

# check registered ip
wget -q -O IP $source/IP.txt
if ! grep -w -q $MYIP IP; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo "Hubungi: Yujin Krabs (fb.com/jordhia atau 0877 7547 4442)"
	else
		echo "Hubungi: Yujin Krabs (fb.com/jordhia atau 0877 7547 4442)"
	fi
	rm -f /root/IP
	exit
fi

echo "------------------------------- BANNED AKAUN SSH -------------------------------"

if [[ $vps = "zvur" ]]; then
	echo "                     ALL SUPPORTED BY ZONA VPS UNTUK RAKYAT                     "
	echo "             			 https://www.facebook.com/jordhia/             			  "
else
	echo "                           ALL SUPPORTED BY ANEKA VPS                           "
	echo "                     	 https://www.facebook.com/jordhia                     	  "
fi

	echo "            DEVELOPED BY YUJIN KRABS (fb.com/jordhia, 087775474442)             "
echo ""

# begin of user-list
echo "-----------------------------------"
echo "USERNAME              EXP DATE     "
echo "-----------------------------------"

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo "-----------------------------------"
echo ""
# end of user-list

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Apakah Anda benar-benar ingin mem-banned akaun [$username] [y/n]: " -e -i y BANNED
	if [[ "$BANNED" = 'y' ]]; then
		echo " User : $username" >> /root/banneduser.txt
		passwd -l $username
		echo ""
		echo "Akaun [$username] berhasil dibanned!"
	else
		echo ""
		echo "Banned akaun [$username] dibatalkan!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi

cd ~/
rm -f /root/IP
