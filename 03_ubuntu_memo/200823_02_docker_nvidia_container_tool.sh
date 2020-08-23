#!/bin/bash

# 確認(nvidia driver)
nvidia-smi

# 確認(nvidia cuda)
nvcc -V

# Dockerをインストール
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD8
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# 確認(Docker)
sudo docker run hello-world

# 確認(Docker version)
docker -v


# --------------------------------------------------------
# NVIDIA container toolkitを使って、dockerのコンテナ上でcudaを動かす
# URL:https://qiita.com/Hiroaki-K4/items/c1be8adba18b9f0b4cef
# --------------------------------------------------------
# 環境
# Ubuntu 18.04
# docker 19.03
# nvidia driver 450.36

# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# 確認(docker --gpus)
sudo docker run --gpus all nvidia/cuda:10.1-base-ubuntu18.04 nvidia-smi

# Dockerコマンドをsudoなしで実行する方法
# URL:https://qiita.com/DQNEO/items/da5df074c48b012152ee
# dockerグループがなければ作る
sudo groupadd docker

# 現行ユーザをdockerグループに所属させる
sudo gpasswd -a $USER docker

# dockerデーモンを再起動する (CentOS7の場合)
sudo systemctl restart docker

# exitして再ログインすると反映される。
