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

echo "------------------------------- MEMBUAT AKUN SSH -------------------------------"

if [[ $vps = "zvur" ]]; then
	echo "                     ALL SUPPORTED BY ZONA VPS UNTUK RAKYAT                     "
	echo "             https://www.facebook.com/groups/Zona.VPS.Untuk.Rakyat/             "
else
	echo "                           ALL SUPPORTED BY ANEKA VPS                           "
	echo "                     https://www.facebook.com/aneka.vps.us                      "
fi

	echo "            DEVELOPED BY YURI BHUANA (fb.com/youree82, 085815002021)            "
echo ""

read -p "Isikan username: " USER

egrep "^$USER" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$USER] sudah ada!"
	exit 1
else
	read -p "Isikan password akun [$USER]: " PASS
	read -p "Berapa hari akun [$USER] aktif: " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $USER
	echo $USER:$PASS | chpasswd

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
	echo "Valid s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")"
	echo "-----------------------------------"
fi

cd ~/
rm -f /root/IP
