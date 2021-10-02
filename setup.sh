#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
                echo "OpenVZ is not supported"
                exit 1
fi    
#install v2ray
rm -f install.sh
wget https://raw.githubusercontent.com/rockneters/garangan/main/install.sh && chmod +x install.sh && ./install.sh
#install ssr
rm -f ssr.sh
wget https://raw.githubusercontent.com/rockneters/garangan/main/ssr.sh && chmod +x ssr.sh && ./ssr.sh
#install ssh
rm -f ssh-vpn.sh
wget https://raw.githubusercontent.com/rockneters/garangan/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh

rm -f ssh-vpn.sh
rm -f ssr.sh
rm -f install.sh

sleep 0.8
clear
neofetch
menu
echo -e "Succes! Reboot vps otomatis"
sleep 1
reboot
