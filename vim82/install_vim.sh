#!/bin/bash

# 彻底卸载vim
if which apt-get >/dev/null; then
sudo apt-get remove --purge vim vim-tiny vim-common vim-runtime gvim vim-common vim-gui-common vim-nox
elif which yum >/dev/null; then
sudo yum remove -y vim-runtime vim-common.x86_64 vim-filesystem.noarch vim-X11.x86_64 gvim vim-clustershell
fi

# 安装依赖库
if which apt-get >/dev/null; then
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial gvim lua5.1 liblua5.1-dev libperl-dev
elif which yum >/dev/null; then
sudo yum install -y libncurses5-devel libgnome2-devel libgnomeui-devel libgtk2.0-devel libatk1.0-devel libcairo2-devel libx11-devel libxpm-devel libxpm-devel libxt-devel python3-devel ruby-devel mercurialel gvim
fi


git clone git@gitee.com:banananaMace/vim82.git ~
cd ~/vim*/src
sudo ./configure --with-features=huge --enable-python3interp=yes --with-python-config-dir=/usr/bin/python3.6m-x86_64-config -enable-gui=gtk2 --enable-cscope --prefix=/usr/local
# VIMRUNTIMEDIR syntax.vim 等依赖文件安装，需要与/usr/local/share/vim/路径下的文件名一致
sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
sudo ln -sf /usr/local/bin/vim /usr/bin/vim
