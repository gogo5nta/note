#■Ubuntu 16.04 のCUIでの文字化け を直すメモ - Qiita   
　https://qiita.com/konzo_/items/65c1679645ba42d347fb   

　.bashrcというファイルに，設定を書くことで解決。   
```
nano .bashrc
```　
　文末まで移動して，以下の文を入力   
　終了はctrl+xで保存してから   
```
case $TERM in
      linux) LANG=C ;;
      *)       LANG=ja_JP.UTF-8;;
esac
```

#■Ubuntu 16.04 をインストールして NVIDIAドライバ (410.48)と CUDA10.0 と cuDNN7.4.1 を入れて Tensorflow-gpu を動かすメモ   
　https://qiita.com/konzo_/items/3e2d1d7480f7ef632603   
