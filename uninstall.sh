#!/bin/bash

Green="\033[1;32m"
Red="\033[1;31m"
RESET="\033[0m"
user_m=$(logname)

set -Eeuo pipefail
trap 'echo -e "${Red} Khong the thuc hien thao tac do loi khong xac dinh, huy thuc thi script.${RESET}" ' ERR

# Thuc thi

echo -e "${Green}[-] Dang go cai dat${RESET}"
sudo systemctl disable check-battery.timer && sudo systemctl daemon-reexec && sudo systemctl daemon-reload
sudo rm -rf /etc/systemd/system/check-battery.service
sudo rm -rf /etc/systemd/system/check-battery.timer
sudo rm -rf /usr/local/bin/battery-shutdownAT.sh
sudo rm -rf /var/log/battery-command.log

echo -e "${Green}[-] Da go cai dat thanh cong ${RESET}"
