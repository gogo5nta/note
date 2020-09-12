#!/bin/bash
# update 2020.09.12

# 参考:https://qiita.com/ohta6/items/684b9ecd4d67a52e5a7f

sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u

sudo reboot

# 確認 (何も出なければOK。nouveauが停止している)
# lsmod | grep -i nouveau

