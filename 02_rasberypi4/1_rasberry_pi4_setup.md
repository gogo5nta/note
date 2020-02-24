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

## 2.3 microSd内のusercfg.txtを設定
microSDをWindows PCから取り出す前に、microSDにある"usercfg.txt"に以下の１行を追加。これを実行しないと音声が出力されない。   
dtparam=audio=on   
詳細はここ[Raspberry Pi 4にUbuntu MATEをインストールしてみた。HDMIから音が出ない？問題も解決](https://bigmoro.cocolog-nifty.com/blog/2019/12/post-90eaca.html)   
![01_usercfg_add](https://user-images.githubusercontent.com/30023363/75148499-209ff280-5743-11ea-884e-fa1ff9338db3.jpg)   

## 2.4 Ubuntu server 18.04のセットアップ
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
　以下のコマンドでUbuntu Mate desktopをインストールし、再起動   
```
$ sudo apt-get install ubuntu-mate-desktop
```

## 3.3 音声出力をHDMiに設定
　Ubuntu MateになってもそのままだとHDMIから音が出ていない以下のコマンドで音声出力をHDMIに設定   
```
amixer -c ALSA cset mumid=3 2
```

# 4. ROS medolicをインストール
## 4.1 インストール用のshを実行
  以下のを入手し、chmod +xで権限を与えた後実行。   
  ・[02_raspi4-ros(Melodic)-install.sh](https://github.com/gogo5nta/note/blob/master/02_rasberypi4/02_raspi4-ros(Melodic)-install.sh)   
  　参考までに、上記内容のコマンドは以下の通り   
```
#!/bin/bash
## Create 2020/02/16 from T.Ishigami

## Reffer
## ROS Melodicのインストール                                   http://joe.ash.jp/program/ros/setup/install_ros_melodic.htm
## Getting Started with ROS Melodic on Raspberry Pi 4 Model B  https://www.hackster.io/shahizat005/getting-started-with-ros-melodic-on-raspberry-pi-4-model-b-cbdec8

## general
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

## Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## Setup your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## To be sure that your Ubuntu package index is up to date, type the following command
sudo apt-get update

## If you will see the following error in the terminal:
## E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
## It can be solved by running following command:
# sudo rm /var/lib/apt/lists/lock

## Install necessary dependencies
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential  cmake

## Install ros-Melodic-desktop-full
sudo apt-get install ros-melodic-desktop-full

## Initialize rosdep
sudo rosdep init
rosdep update

## Setting up the ROS environment variables
echo “source /opt/ros/melodic/setup.bash” >> ~/.bashrc
source /opt/ros/melodic/setup.bash

## Create and initialize the catkin workspace
mkdir -p ~/catkin_workspace/src
cd ~/catkin_workspace/src
catkin_init_workspace
cd ~/catkin_workspace/
catkin_make

## Add the catkin_workspace to your ROS environment
echo “source ~/catkin_workspace/devel/setup.bash” >> ~/.bashrc

## Step 11: Check the ROS environment variables
export | grep ROS
```

# 5. 環境構築(ソフト)
## 5.1 よく使うソフト(chromium-browzer)のインストール
　chromium-browzerをインストール。ここも参考に[Ubuntu 18.04: ウェブブラウザのChromiumをインストールする](https://www.hiroom032.com/2018/05/04/ubuntu-1804-chromium-ja/)   
```
$ sudo apt-get install chromium-browzer
```
![03_Chromium](https://user-images.githubusercontent.com/30023363/75156952-821d8c80-5756-11ea-891a-359bcf59b6a8.png)   

## 5.2 よく使うソフト(Terminator)のインストール
　Terminatorをインストール。ここも参考に[Ubuntu初心者がROSを使うときにおすすめのターミナル「terminator」](http://cryborg.hatenablog.com/entry/2016/09/03/164940)   
```
$ sudo apt-get install terminator
```
![03_terminator](https://user-images.githubusercontent.com/30023363/75157474-88603880-5757-11ea-8f90-d10a59908224.png)   

## 5.3 キーボードのレイアウト変更(JPキーボード)
　Ubuntu MateのMenu > Contorol Center > KeyBoardを選択し、AddでJapanを追加後、一番上に移動   
 ![03_keyboard](https://user-images.githubusercontent.com/30023363/75157546-afb70580-5757-11ea-9c20-6e45df781885.png)   
 
## 5.4 日本語入力の設定
　・[Live USB『Ubuntu MATE 18.10』日本語化も簡単…設定も保存可能！](https://report.hot-cafe.net/ubuntumate-1810-liveusb-6659)  
 　上記を参考に日本語設定を実施。   
  
   まず、Ubuntu MateのMenu > Contorol Center > Language Supportを選択。   
   次に、install/Remove Languagesを選択し、English」と「Japanese」以外のチェックをはずす。   
   その後、ウインドウ内の一番下の「日本語」を、つまむ形でドラッグして「English」の上に持って行き、「Apply System Wide」をクリックして確定。
   Keyboard input method system:」に「fcitx」か確認。
   ![03_Lang4](https://user-images.githubusercontent.com/30023363/75158580-c4949880-5759-11ea-84ba-9fb86193fec5.png)   
   
   その後、タブ「Regional Formats」を開き、画像のように「日本語」を選択し、「Apply System Wide」をクリックして確定   
   ![03_Lang5](https://user-images.githubusercontent.com/30023363/75158613-d4ac7800-5759-11ea-90ab-5254689747c3.png)   

   次に、再起動後、Ubuntu MateのMenu > Contorol Center > Fcitx設定を選択   
   ![03_Lang5](https://user-images.githubusercontent.com/30023363/75159401-67014b80-575b-11ea-9ca1-91d2e5b4b02d.png)   
   
   入力メソッドの設定 > 全体の設定 > 入力メソッドのオンオフで、ctlr+spaceの隣を選択し、半角/全角ボタンを押す。   
   これで、半角/全角ボタンで日本語入力をOn/Off可能。
   ![03_Lang6](https://user-images.githubusercontent.com/30023363/75159424-784a5800-575b-11ea-9306-5695a84e6e2b.png)

   
