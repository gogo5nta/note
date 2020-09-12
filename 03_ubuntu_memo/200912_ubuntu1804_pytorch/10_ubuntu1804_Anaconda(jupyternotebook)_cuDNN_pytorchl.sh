#!/bin/bash
# update 2020.09.12

# --------------------------------------------------------
# Ubuntu 18.04 LTS Desktop��CUDA/Anaconda�ɂ��f�B�[�v���[�j���O�����\�z�iPyTorch�j
# https://lab4ict.com/system/archives/3083
# --------------------------------------------------------

# --------------------------------------------------------
# 1. CUDA 10.02���C���X�g�[������Ă��邩�m�F
# �Q�l: 01_ubuntu1804_nvidia_driver_cuda_install.sh
# --------------------------------------------------------
# CUDA ver�m�F(10.2�ɂȂ��Ă��邩)
nvcc -V

# --------------------------------------------------------
# 2. Anaconda���C���X�g�[��
# �Q�l: https://lab4ict.com/system/archives/3040
# �Q�l: https://qiita.com/yto1292/items/8efcb6175828debf7395
# --------------------------------------------------------
# �����N����Q�Ƃ��A�Y���t�@�C����DL
curl -O  https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

# �C���X�g�[���̎��s
bash Anaconda3-2020.07-Linux-x86_64.sh

# conda��path�ǉ�
# �ȉ���ǉ������TurboVNC(VNC�n)�Ń��O�C�����ʂ����ɁB����
# echo "export PATH=~/anaconda3/bin:$PATH"  >> ~/.bashrc

# --------------------------------------------------------
# 3. cuDNN 7.6.4�̃C���X�g�[�� (CUDA10.1(10.2)�ł�cuDNN8�n�͕s�\)
# �Q�l: https://lab4ict.com/system/archives/2969                                                 ���Љ�L��
# �Q�l: http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/   ��Download��
# �Q�l: https://qiita.com/Navier/items/ec0562e42d8c6e2f504a                                      ��CUDA10.1(10.2)�ł�cuDNN8�n�͕s�\
# --------------------------------------------------------
# nvidia��HP����cuDNN���C���X�g�[�� (���O�Ƀ��O�C�����Ȃ���DL�ł��Ȃ�)
# https://developer.nvidia.com/cudnn
#   ��
# cuDNN Runtime Library for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7_7.6.5.32-1%2Bcuda10.1_amd64.deb
#
# cuDNN Developer Library for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7-dev_7.6.5.32-1%2Bcuda10.1_amd64.deb
#
# cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb)
#   https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7-doc_7.6.5.32-1%2Bcuda10.1_amd64.deb

# Download�����t�H���_�܂ňړ��������t��
cd  libcudnn7_7.6.5.32-1+cuda10.2
chmod +x libcudnn7*

# install
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.5.32-1%2Bcuda10.1_amd64.deb

# �C���X�g�[���̌���
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd  $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN

# --------------------------------------------------------
# 4. PyTorch���C���X�g�[��
# --------------------------------------------------------
# PyTorch��HP�ŁA�C���X�g�[���p�̃R�}���h����
# PyTorch��stable(1.6.0)�ł�CUDA 10.2�Aconda�ŃC���X�g�[��
# https://pytorch.org/ 
#�@��
export PATH=~/anaconda3/bin:$PATH
conda install pytorch torchvision cudatoolkit=10.2 -c pytorch

# �m�F
cuda list pytorch



# --------------------------------------------------------
# ���̑��A�Q�l���
# --------------------------------------------------------

# --------------------------------------------------------
#��NVIDIA Docker ���č��ǂ��Ȃ��Ă�́H (20.09 ��)
#�@https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44
# --------------------------------------------------------
#�@��
#�ENVIDIA Docker ver2.2.1�ȍ~���uNVIDIA Container Toolkit �v
#�Eubuntu 18.04��CUDA11.0���C���X�g�[������� (cuda-drivers�̂�)
#---------------------------------------------
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
#sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
#wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
#sudo dpkg -i cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
#sudo apt-key add /var/cuda-repo-ubuntu1804-11-0-local/7fa2af80.pub
#sudo apt-get -y install cuda-drivers
#---------------------------------------------
# ����cuda 10.2������ꍇ
#   �Q�l: https://qiita.com/Navier/items/ec0562e42d8c6e2f504a
#         CUDA10.1(10.2)�ł�cuDNN8�n�͕s�\
#sudo apt-get install -y --no-install-recommends cuda-10-2

# --------------------------------------------------------
#��Pytorch��Cuda��nvidia docker(nvidia container toolkit)�̊֌W
#  PyTorch�C���X�g�[������CUDA�o�[�W�����̑I�ѕ�
#  https://katsuwosashimi.com/archives/742/how-to-choose-cuda-version-pytorch/
# --------------------------------------------------------
# 1. GPU��CUDA�ɑΉ����Ă��邩�m�F
#  �ȉ��̃y�[�W��CUDA�Ή��m�F�iGeforce �Ȃ�Ή�)
#  https://developer.nvidia.com/cuda-gpus
#
# 2. CUDA Toolkit�ƌ݊����̂���NVIDIA�h���C�o�̊m�F
#  �ȉ��̃y�[�W�Ŋm�F(CUDA 11.0.1 RC�Ȃ� driver 450.36.06�ȏ�)
#  https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html
#�@�@��
#  Nvidia�h���C�o�[���g�p���Ă��邩�m�F
#  $ lshw -c video
#
# 3. PyTorch���Ή�����CUDA�̊m�F
#  �ȉ��̃y�[�W�Ŋm�F�BPyTorch��stable(1.6.0)�ł�CUDA 10.2�܂ŃT�|�[�g
#  https://pytorch.org/ 
