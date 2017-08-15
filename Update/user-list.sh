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

JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

echo "-----------------------------------"
echo "Jumlah akun: $JUMLAH user"
echo "-----------------------------------"
echo ""
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
echo ""

cd ~/
rm -f /root/IP
