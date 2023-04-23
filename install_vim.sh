#!/bin/bash

# 安装依赖库
if which apt-get >/dev/null; then
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
elif which yum >/dev/null; then
sudo yum install -y libncurses5-devel
sudo yum install -y libgnome2-devel
sudo yum install -y libgnomeui-devel
sudo yum install -y libgtk2.0-devel
sudo yum install -y libatk1.0-devel
sudo yum install -y libbonoboui2-devel
sudo yum install -y libcairo2-devel
sudo yum install -y libx11-devel
sudo yum install -y libxpm-devel
sudo yum install -y libxt-devel
sudo yum install -y python3-devel                                                                                                                                             
sudo yum install -y ruby-devel
sudo yum install -y mercurialel
fi


git clone git@gitee.com:wennan_w/vim82.git ~
cd ~/vim*/src
sudo ./configure --with-features=huge --enable-python3interp=yes --with-python-config-dir=/usr/bin/python3.6m-x86_64-config -enable-gui=gtk2 --enable-cscope --prefix=/usr/local
sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
sudo ln -sf /usr/local/share/vim/vim82/bin/vim /usr/bin/vim
