#!/bin/bash

Green="\033[1;32m"
Red="\033[1;31m"
RESET="\033[0m"
user_m=$(logname)

set -Eeuo pipefail
trap 'echo -e "${Red} Khong the thuc hien thao tac do loi khong xac dinh, huy thuc thi script.${RESET}" ' ERR

#Thuc Thi

echo -e "${Green}[-] Copy script battery-shutdownAT.sh => /usr/local/bin/${RESET}"
sudo cp "/home/$user_m/autoShutdown/battery-shutdownAT.sh" /usr/local/bin/
sudo chmod +x /usr/local/bin/battery-shutdownAT.sh

echo -e "${Green}[-]Copy check-battery.service va check-battery.timer => /etc/systemd/system/${RESET}"
sudo cp "/home/$user_m/autoShutdown/check-battery.service" /etc/systemd/system/
sudo cp "/home/$user_m/autoShutdown/check-battery.timer" /etc/systemd/system/

echo -e "${Green}[-] Dang khoi dong he thong dong thoi cap quyen neu can thiet${RESET}"
sudo systemctl daemon-reexec && sudo systemctl daemon-reload && sudo systemctl enable check-battery.timer && sudo systemctl start check-battery.timer

echo -e "${Green}[-] Dang khoi tao battery-command.log va cap quyen ${RESET}"
sudo touch /var/log/battery-command.log
sudo chmod 644 /var/log/battery-command.log
sudo chown "$user_m:$user_m" /var/log/battery-command.log
echo "---------Battery Logs Entries(auto shutdown)--------" | sudo tee -a /var/log/battery-command.log > /dev/null

echo -e "${Green} Da Cai Dat Thanh Cong!${RESET}"


