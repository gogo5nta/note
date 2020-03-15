# ■VirtualGL + TurboVNC によるリモートOpenGL(おすすめ)
　・[OpenGL Remote](https://geraniums.hatenablog.com/entry/2018/05/25/151153)  
  ・[Ubuntu 18.04にGeForceを積んで遊んでみる](https://qiita.com/exthnet/items/dcb0bd94f09a2b4c9835)   
## ■Ubuntu 16.04 のCUIでの文字化けを直す
```
nano ~/.bashrc
```
　文末まで移動して，以下の文を入力   
　終了はctrl+xで保存

```
case $TERM in
      linux) LANG=C ;;
      *)       LANG=ja_JP.UTF-8;;
esac
```
以下のコードで反映   
```
source ~/.bashrc
``` 

## Get Virtualgl and TurboNVC
・[The .deb package for VirtualGL on sourceforge (latest version: 2.6.3)](https://sourceforge.net/projects/virtualgl/files/)   
・[The .deb package for TurboVNC on sourceforge (latest version: 2.2.4)](https://sourceforge.net/projects/turbovnc/files/)   

## Install and Setting
```
# install virtualgl
sudo dpkg -i virtualgl_*_amd64.deb
 
# stop lightdm
# Ctl + Alt + F1でCUIに移動。事前に文字化け対策必要
sudo systemctl stop lightdm
 
# setup virtualgl
# 途中の質問は右を参考 https://virtualgl.org/vgldoc/2_2_1/#hd005001
# 1, y, y, y, x 
sudo /opt/VirtualGL/bin/vglserver_config

# start lightdm
sudo systemctl start lightdm
xauth merge /etc/opt/VirtualGL/vgl_xauth_key

# GUIに移動
# install turboVNC
sudo dpkg -i turbovnc_*_amd64.deb
 
# start TurboVNC
# 初回はパスワード登録。パスワード文字列長が8に制限されているのに注意
/opt/TurboVNC/bin/vncserver -depth 24

# make alias
# turbovncの起動エイリアスを作成. nano ~/.bashrcを実行し
alias TVNC='/opt/TurboVNC/bin/vncserver -depth 24' 
```
