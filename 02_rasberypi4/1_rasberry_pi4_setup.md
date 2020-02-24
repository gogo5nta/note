# 1. Rasberry Pi4のセットアップ(HW)
## 1.1 ケース、ファン、SD Card一体型の購入
・[LABISTS Raspberry4 4B-64GB の購入 1.4万円] (https://www.amazon.co.jp/dp/B082VVBKRP)  
  ![00_raspi4_set](https://user-images.githubusercontent.com/30023363/75141474-57bad780-5734-11ea-8cb5-5487b400cd98.jpg)  
  上記セットを買うと、raspi 4GB本体、ACアダプタ、ファン付ケース、MicroSD 32GBが揃っており、おすすめ  

## 1.2 ケース、ファンの組み立て
 ・[【開封レビュー】LABISTS ラズパイ4B（メモリ4GB）セットを購入してみた！](https://chasuke.com/raspi4b/)  
 ・[Raspberry Pi 4 Model B でケースファンを取り付ける](https://qiita.com/m-tmatma/items/57b452dce33f4a84ddee)  
 ・[GPIO － Raspberry Pi公式ドキュメントを日本語訳](http://igarashi-systems.com/sample/translation/raspberry-pi/usage/gpio.html)   
 上記サイトを参考に、ケースを組み立て、CPUファンを取り付ける。まず、CPUファンの赤を左上から2番目の4番PIN赤(5V)に、黒を左上から3番目の6番PIN(Ground)に接続。  
 　続いて、残りのファンを写真の通りに貼る。  
   ![00_Raspy4_fan_info0](https://user-images.githubusercontent.com/30023363/75142832-3d362d80-5737-11ea-8f1e-fa3d713e78fc.jpg)  
   ![00_Raspy4_fan_info1](https://user-images.githubusercontent.com/30023363/75142099-ab79f080-5735-11ea-9cde-4c5052efc09b.jpg)  
## 1.3 HDMI→HDMI miniへの変換アダプタを入手(オプション)
  購入したケースにはHDMI miniケーブルが2本入っているが、接続がシビア（ギリギリ）のため、HDMIケーブルに余裕がある場合、
  100均かアマゾンでHDMI→HDMI mini変換ケーブルを購入し接続することをお勧めする。   
 ・[ダイソー(100均)HDMI変換器・アダプタ/micro/ミニ/USBは販売してる!?](https://fox-god.com/photodiary/wp/archives/1859)  
  ![00_HDMI_mini](https://user-images.githubusercontent.com/30023363/75146211-f0098a00-573d-11ea-88a0-9211fe2b29be.jpg)  
 ・[HDMI 接続 変換 ４つセット mini HDMI 320円](https://www.amazon.co.jp/dp/B00K09EIWC)　　
 　![00_amazon_HDIM_mini](https://user-images.githubusercontent.com/30023363/75146348-41197e00-573e-11ea-95cf-2f044c2631a6.jpg)　　
  
# 2. Raberry Pi4のセットアップ(SW、Windows端末を利用)
## 2.1 Ubuntu 18.04 serverの入手
・[Ubuntu.com](https://ubuntu.com/download/raspberry-pi)  
  上記サイトより、Raspberry Pi 4 > Ubuntu 18.04.4 LTS > 64bitを選択。ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img.xzを入手。 
  ![01_ubuntu_image_dl](https://user-images.githubusercontent.com/30023363/75144985-7c667d80-573b-11ea-9e8d-d44cbe24e2c4.jpg)　　
  [winrar](https://www.winrarjapan.com/download)などを用いて、xzを解凍し、ubuntu-18.04.4-preinstalled-server-arm64+raspi3.imgを入手 

## 2.2 imgファイルをWin32 Disk Imagerで焼く
・[窓の杜 Win32 Disk Imager](https://forest.watch.impress.co.jp/docs/review/1067836.html)  
  上記サイトより、Win32 Disk Imagerを入手し、2.1で入手し解凍したimgファイルをmicorSDに焼く　　
  ![01_win32DiskImage_write_imgfile](https://user-images.githubusercontent.com/30023363/75145666-bbe19980-573c-11ea-92a4-12cd6f516025.jpg)　　

## 2.3 Ubuntu server 18.04のセットアップ
　購入したセットに付属のACアダプタ(5V_3A)と、HDMIとキーボードをrasberry pi4に接続し、2.2で焼いたMicroSDを差し込んだ後、
 電源をOnにすると、以下の画面が表示される。   
![02_ubuntu_server_first_login](https://user-images.githubusercontent.com/30023363/75147060-cb161680-573f-11ea-9844-694a127147ae.jpg)   
　[ID / PASS]  ubuntu / ubuntuでログイン後、パスワードを任意に変更。
### 2.3.1 userアカウントを作成
　以下のコマンドでsudo可能なuser[user_name]を作成。[参考ページはここ](https://qiita.com/white_aspara25/items/c1b9d02310b4731bfbaa)   
```
 $ sudo adduser [user_name]
 $ sudo gpasswd -a [user_name] sudo
```

# 3. Ubuntu Mate desktopをインストール
## 3.1 システムアップデート 
 以下のコマンドでシステムをアップデート   
```
$ sudo apt-get update
$ sudo apt-get upgrade
```

## 3.2 Ubuntu Mateインストール
　以下のコマンドでUbuntu Mate desktopをインストール   
```
$ sudo apt-get install ubuntu-mate-desktop
```

## 3.3 音声出力をHDMiに設定
　以下のコマンドで音声出力をHDMIに設定   
```
amixer -c ALSA cset mumid=3 2
```
