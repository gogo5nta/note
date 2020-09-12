#!/bin/bash
# update 2020.09.12

# --------------------------------------------------------
# Ubuntu 18.04 LTS DesktopにCUDA/Anacondaによるディープラーニング環境を構築（PyTorch）
# https://lab4ict.com/system/archives/3083
# --------------------------------------------------------

# --------------------------------------------------------
# 1. CUDA 10.02がインストールされているか確認
# 参考: 01_ubuntu1804_nvidia_driver_cuda_install.sh
# --------------------------------------------------------
# CUDA ver確認(10.2になっているか)
nvcc -V

# --------------------------------------------------------
# 2. Anacondaをインストール
# 参考: https://lab4ict.com/system/archives/3040
# 参考: https://qiita.com/yto1292/items/8efcb6175828debf7395
# --------------------------------------------------------
# リンク先を参照し、該当ファイルをDL
curl -O  https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

# インストールの実行
bash Anaconda3-2020.07-Linux-x86_64.sh

# condaのpath追加
# 以下を追加するとTurboVNC(VNC系)でログイン後画面が黒に。注意
# echo "export PATH=~/anaconda3/bin:$PATH"  >> ~/.bashrc

# --------------------------------------------------------
# 3. cuDNN 7.6.4のインストール (CUDA10.1(10.2)ではcuDNN8系は不可能)
# 参考: https://lab4ict.com/system/archives/2969                                                 ※紹介記事
# 参考: http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/   ※Download先
# 参考: https://qiita.com/Navier/items/ec0562e42d8c6e2f504a                                      ※CUDA10.1(10.2)ではcuDNN8系は不可能
# --------------------------------------------------------
# nvidiaのHPからcuDNNをインストール (事前にログインしないとDLできない)
# https://developer.nvidia.com/cudnn
#   ↓
# cuDNN Runtime Library for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7_7.6.5.32-1%2Bcuda10.1_amd64.deb
#
# cuDNN Developer Library for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7-dev_7.6.5.32-1%2Bcuda10.1_amd64.deb
#
# cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7-doc_7.6.5.32-1%2Bcuda10.1_amd64.deb

# Downloadしたフォルダまで移動し権限付加
cd  libcudnn7_7.6.5.32-1+cuda10.2
chmod +x libcudnn7*

# install
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.5.32-1%2Bcuda10.1_amd64.deb

# インストールの検証
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd  $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN

# --------------------------------------------------------
# 4. PyTorchをインストール
# --------------------------------------------------------
# PyTorchのHPで、インストール用のコマンド調査
# PyTorchのstable(1.6.0)ではCUDA 10.2、condaでインストール
# https://pytorch.org/ 
#　↓
export PATH=~/anaconda3/bin:$PATH
conda install pytorch torchvision cudatoolkit=10.2 -c pytorch

# 確認
cuda list pytorch



# --------------------------------------------------------
# その他、参考情報
# --------------------------------------------------------

# --------------------------------------------------------
#■NVIDIA Docker って今どうなってるの？ (20.09 版)
#　https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44
# --------------------------------------------------------
#　↓
#・NVIDIA Docker ver2.2.1以降が「NVIDIA Container Toolkit 」
#・ubuntu 18.04にCUDA11.0をインストールする例 (cuda-driversのみ)
#---------------------------------------------
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
#sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
#wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
#sudo dpkg -i cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
#sudo apt-key add /var/cuda-repo-ubuntu1804-11-0-local/7fa2af80.pub
#sudo apt-get -y install cuda-drivers
#---------------------------------------------
# ↑にcuda 10.2を入れる場合
#   参考: https://qiita.com/Navier/items/ec0562e42d8c6e2f504a
#         CUDA10.1(10.2)ではcuDNN8系は不可能
#sudo apt-get install -y --no-install-recommends cuda-10-2

# --------------------------------------------------------
#■PytorchとCudaとnvidia docker(nvidia container toolkit)の関係
#  PyTorchインストール時のCUDAバージョンの選び方
#  https://katsuwosashimi.com/archives/742/how-to-choose-cuda-version-pytorch/
# --------------------------------------------------------
# 1. GPUがCUDAに対応しているか確認
#  以下のページでCUDA対応可確認（Geforce なら対応)
#  https://developer.nvidia.com/cuda-gpus
#
# 2. CUDA Toolkitと互換性のあるNVIDIAドライバの確認
#  以下のページで確認(CUDA 11.0.1 RCなら driver 450.36.06以上)
#  https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html
#　　↓
#  Nvidiaドライバーを使用しているか確認
#  $ lshw -c video
#
# 3. PyTorchが対応するCUDAの確認
#  以下のページで確認。PyTorchのstable(1.6.0)ではCUDA 10.2までサポート
#  https://pytorch.org/ 
