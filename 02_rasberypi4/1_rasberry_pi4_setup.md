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
   ![00_Raspy4_fan_info0](https://user-images.githubusercontent.com/30023363/75142286-1c210d00-5736-11ea-9376-a42af0d67f2f.jpg)  
   
# 2. Raberry Pi4のセットアップ(SW、Windows端末を利用)
## 2.1 Ubuntu 18.04 serverの入手
・[Ubuntu.com](https://ubuntu.com/download/raspberry-pi)  
  上記サイトより、Raspberry Pi 4 > Ubuntu 18.04.4 LTS > 64bitを選択。ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img.xzを入手。 
  ![01_ubuntu_image_dl](https://user-images.githubusercontent.com/30023363/75144985-7c667d80-573b-11ea-9e8d-d44cbe24e2c4.jpg)　　
  [winrar](https://www.winrarjapan.com/download)などを用いて、xzを解凍し、ubuntu-18.04.4-preinstalled-server-arm64+raspi3.imgを入手
