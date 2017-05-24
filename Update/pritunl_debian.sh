#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
curl -s -o ip.txt https://raw.githubusercontent.com/r38865/VPS/master/Update/IP.txt
find=`grep $myip ip.txt`
if [ "$find" = "" ]
then
clear
echo ""
echo "     

                   WE ARE SORRY YOUR IP NOT REGISTER YET    
               =============== OS-32 & 64-bit ================
               ♦                                             ♦
               ♦       AUTOSCRIPT CREATED BY LEE DZUNG       ♦
               ♦       -----------About Us------------       ♦ 
               ♦            Tel : +60146463183               ♦
               ♦         { Sms/whatsapp/telegram }           ♦ 
               ♦       http://leedzung-autoscript.net        ♦    
               ♦ http://www.facebook.com/leedzung.autoscript ♦
               ♦                                             ♦
               =============== OS-32 & 64-bit ================
               
                 Please make payment before use auto script
                 ..........................................
                 .           Price: RM20 = 1IP            .
                 .          *****************             .
                 .           Maybank Account              .
                 .           =================            .
                 .          No   : 158202230777           .
                 .          Name : LEE XUAN DUNG          .
                 ..........................................   
                          Thank You For Choice Us
"
exit
fi
if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi
echo "
AUTOSCRIPT BY LEE DZUNG

PLEASE CANCEL ALL PACKAGE POPUP

TAKE NOTE !!!"
clear
echo "START AUTOSCRIPT"
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear

sudo tee -a /etc/apt/sources.list.d/mongodb-org-3.4.list << EOF
deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.4 main
EOF

sudo tee -a /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt wheezy main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 0C49F3730359A14518585931BC711F9BA15703C6
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get --assume-yes install pritunl mongodb-org
sudo service mongod start
sudo service pritunl start
