#!/bin/bash

cd ~
git clone git@gitee.com:wennan_w/vim82.git
cd vim82/src
sudo ./configure --with-features=huge --enable-python3interp=yes --with-python-config-dir=/usr/bin/python3.6m-x86_64-config --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --prefix=/usr/local
sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
sudo ln -s /usr/local/share/vim/vim82/bin/vim /usr/bin/vim
