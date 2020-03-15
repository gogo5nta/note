# ��VirtualGL + TurboVNC �ɂ�郊���[�gOpenGL(��������)
�@�E[OpenGL Remote](https://geraniums.hatenablog.com/entry/2018/05/25/151153)  
  �E[Ubuntu 18.04��GeForce��ς�ŗV��ł݂�](https://qiita.com/exthnet/items/dcb0bd94f09a2b4c9835)   
## ��Ubuntu 16.04 ��CUI�ł̕��������𒼂�
```
nano ~/.bashrc
```
�@�����܂ňړ����āC�ȉ��̕������   
�@�I����ctrl+x�ŕۑ�

```
case $TERM in
      linux) LANG=C ;;
      *)       LANG=ja_JP.UTF-8;;
esac
```
�ȉ��̃R�[�h�Ŕ��f   
```
source ~/.bashrc
``` 

## Get Virtualgl and TurboNVC
�E[The .deb package for VirtualGL on sourceforge (latest version: 2.6.3)](https://sourceforge.net/projects/virtualgl/files/)   
�E[The .deb package for TurboVNC on sourceforge (latest version: 2.2.4)](https://sourceforge.net/projects/turbovnc/files/)   

## Install and Setting
```
# install virtualgl
sudo dpkg -i virtualgl_*_amd64.deb
 
# stop lightdm
# Ctl + Alt + F1��CUI�Ɉړ��B���O�ɕ��������΍��K�v
sudo systemctl stop lightdm
 
# setup virtualgl
# �r���̎���͉E���Q�l https://virtualgl.org/vgldoc/2_2_1/#hd005001
# 1, y, y, y, x 
sudo /opt/VirtualGL/bin/vglserver_config

# start lightdm
sudo systemctl start lightdm
xauth merge /etc/opt/VirtualGL/vgl_xauth_key

# GUI�Ɉړ�
# install turboVNC
sudo dpkg -i turbovnc_*_amd64.deb
 
# start TurboVNC
# ����̓p�X���[�h�o�^�B�p�X���[�h�����񒷂�8�ɐ�������Ă���̂ɒ���
/opt/TurboVNC/bin/vncserver -depth 24

# make alias
# turbovnc�̋N���G�C���A�X���쐬. nano ~/.bashrc�����s��
alias TVNC='/opt/TurboVNC/bin/vncserver -depth 24' 
```
