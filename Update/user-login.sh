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

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo "-----------------------------------"
echo "Checking Dropbear login";
echo "-----------------------------------"
for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	username=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $username - $IP";
	fi
done

echo "";

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
echo "-----------------------------------"
echo "Checking OpenSSH login";
echo "-----------------------------------"
for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
	username=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
	IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $username - $IP";
	fi
done

echo "";

echo "-----------------------------------"
echo "Checking OpenVPN login";
echo "-----------------------------------"
tail -f /etc/openvpn/server-vpn.log

echo "";

echo "-----------------------------------"
echo "Checking PPTP login";
echo "-----------------------------------"
last | grep ppp | grep still

echo "";

#Melihat Riwayat Login User
echo "-----------------------------------"
echo "Checking PPTP Login History";
echo "-----------------------------------"
last | grep ppp

echo "";
echo "----------------------------------------------------------------"
echo " Kalau ada Multi Login Kill Aja "
echo " Tetap Multi Login Ganti Passnya baru Kill Lagi "
echo " Caranya pake Kill nomor PID "
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
