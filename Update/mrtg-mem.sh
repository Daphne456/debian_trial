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
		echo "Hubungi: Yujin Krabs (fb.com/youree82 atau 0877 7547 4442)"
	else
		echo "Hubungi: Yujin Krabs (fb.com/youree82 atau 0877 7547 4442)"
	fi
	rm -f /root/IP
	exit
fi

FREE=`free -m | grep "buffers/cache" | awk '{print $3}'`
SWAP=`free -m | grep "Swap" | awk '{print $3}'`
UP=`uptime`

echo $FREE
echo $SWAP
echo $UP
echo "----------------------------------------------------------------" 

if [[ $vps = "zvur" ]]; then
	echo " ALL SUPPORTED BY ZONA VPS UNTUK RAKYAT"
	echo " https://www.facebook.com/groups/Zona.VPS.Untuk.Rakyat/"
else
	echo " ALL SUPPORTED BY ANEKA VPS"
	echo " https://www.facebook.com/aneka.vps.us"
fi

	echo " DEVELOPED BY YURI BHUANA (fb.com/youree82, 085815002021)"
echo "----------------------------------------------------------------" 

cd ~/
rm -f /root/IP
