#!/bin/bash

echo #wget virtualgl_2.6.4_amd64.deb
wget https://sourceforge.net/projects/virtualgl/files/2.6.4/virtualgl_2.6.4_amd64.deb/download
mv download virtualgl_2.6.4_amd64.deb

echo #wget turbovnc_2.2.5_amd64.deb
wget https://sourceforge.net/projects/turbovnc/files/2.2.5/turbovnc_2.2.5_amd64.deb/download
mv download turbovnc_2.2.5_amd64.deb

echo # install virtualgl
sudo dpkg -i virtualgl_*_amd64.deb
