#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color

cd /etc/systemd/system/
rm -rf kyt.service
cd
grenbo="\e[92;1m"
NC='\e[0m'
#install
cd /usr/bin
rm -rf kyt
rm -rf bot
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://vvip.kvm-xcode.biz.id/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://vvip.kvm-xcode.biz.id/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
clear
#isi data
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot api Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e ""
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt.sh
clear
echo ""
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin             : $admin"
echo "Domain            : $domain"
echo "Pub               : $PUB"
echo "Host              : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo " KETIK : /menu DI BOT ANDA UNTUK MENJALANKAN BOT TELEGRAM ANDA"
