#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

vps="zvur";
#vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="http://anekascript.anekavps.us"
fi

# go to root
cd

echo "--------------------------- GANTI PASSWORD  AKUN SSH ---------------------------"

if [[ $vps = "zvur" ]]; then
	echo "                     ALL SUPPORTED BY ZONA VPS UNTUK RAKYAT                     "
	echo "             https://www.facebook.com/groups/Zona.VPS.Untuk.Rakyat/             "
else
	echo "                           ALL SUPPORTED BY ANEKA VPS                           "
	echo "                     https://www.facebook.com/aneka.vps.us                      "
fi

	echo "            DEVELOPED BY YURI BHUANA (fb.com/youree82, 085815002021)            "
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

read -p "Isikan username: " USER

egrep "^$USER" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Isikan password baru akun [$USER]: " PASS
	read -p "Konfirmasi password baru akun [$USER]: " PASS1
	echo ""
	if [[ $PASS = $PASS1 ]]; then
		echo $USER:$PASS | chpasswd
		echo "Penggantian password akun [$USER] Sukses"
		echo ""
		echo "-----------------------------------"
		echo "Data Login:"
		echo "-----------------------------------"
		echo "Host/IP: $MYIP"
		echo "Dropbear Port: 443, 110, 109"
		echo "OpenSSH Port: 22, 143"
		echo "Squid Proxy: 80, 8080, 3128"
		echo "OpenVPN Config: http://$MYIP:81/client.ovpn"
		echo "Username: $USER"
		echo "Password: $PASS"
		#echo "Valid s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")"
		echo "-----------------------------------"
	else
		echo "Penggantian password akun [$USER] Gagal"
		echo "[Password baru] & [Konfirmasi Password Baru] tidak cocok, silahkan ulangi lagi!"
	fi
else
	echo "Username [$USER] belum terdaftar!"
	exit 1
fi

cd ~/
rm -f /root/IP
