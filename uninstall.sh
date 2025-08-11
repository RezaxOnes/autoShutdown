#!/bin/bash

Green="\033[1;32m"
Red="\033[1;31m"
RESET="\033[0m"
user_m=$(logname)

set -Eeuo pipefail
trap 'echo -e "${Red} Khong the thuc hien thao tac do loi khong xac dinh, huy thuc thi script.${RESET}" ' ERR

# Thuc thi

echo -e "${Green}[-] Dang go cai dat${RESET}"
echo -e "${Green}[-] Ngung hoat dong chuc nang${RESET}"
sudo systemctl stop check-battery.timer && sudo systemctl disable check-battery.timer && sudo systemctl daemon-reexec && sudo systemctl daemon-reload
echo -e "${Green}[-] Tien hanh xoa file${RESET}"
echo -e "${Green}[-] Dang xoa check-battery.service va check-battery.timer${RESET}"
sudo rm -f /etc/systemd/system/check-battery.service
sudo rm -f /etc/systemd/system/check-battery.timer
echo -e "${Green}[-] Dang xoa battery-shutdownAT.sh${RESET}"
sudo rm -f /usr/local/bin/battery-shutdownAT.sh
echo -e "${Green}[-] Dang xoa battery-command.log${RESET}"
sudo rm -f /var/log/battery-command.log

echo -e "${Green}[-] Da go cai dat thanh cong [-]${RESET}"
