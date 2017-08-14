#!/bin/bash

read -d "~" -p "Silahkan Paste Banner anda disini (\"~\" jika sudah selesai):
" line

cat > /etc/issue.net <<-END
$line

################################################################################
##                                                                            ##
##                         ALL SUPPORTED BY VOZOV VPS                         ##
##                      https://www.facebook.com/jordhia                      ##
##             DEVELOPED BY YUJIN KRABS (fb.com/jordhia, 08777547442)         ##
##                                                                            ##
################################################################################
##################  CLOSE BANNER INI AGAR ANDA BISA BROWSING  ##################
END

service dropbear restart
service ssh restart
