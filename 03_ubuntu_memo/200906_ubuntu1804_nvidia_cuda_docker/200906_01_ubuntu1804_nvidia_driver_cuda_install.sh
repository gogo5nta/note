#!/bin/bash

# --------------------------------------------------------
# Ubuntu18.04にNVIDIA Container Toolkitをインストールする
# https://qiita.com/Wisteria30/items/6f1e35e600e93ff2c54b
# --------------------------------------------------------
# HP通りやる。ただしcuda-10-1と指定
# URL：https://qiita.com/Wisteria30/items/6f1e35e600e93ff2c54b
# URL: https://medium.com/@exesse/cuda-10-1-installation-on-ubuntu-18-04-lts-d04f89287130

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
sudo apt-get update
# 自動で合うdriverを入れてくれる
# sudo ubuntu-drivers autoinstallだと435, 以下コマンドだと418のインストールを確認
sudo apt-get -y install cuda-drivers
sudo apt-get -y install cuda-10-1

# 以下を.bashrcに追加
# export PATH="/usr/local/cuda/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

echo "# CUDA setting" >> ~/.bashrc
echo 'export PATH="/usr/local/cuda/bin:$PATH"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"' >> ~/.bashrc

# 再起動時画面が黒くなるので、sudo apt-get update & upgradeを実施
sudo apt-get update
sudo apt-get upgrade
