#!/bin/bash
# tmux_download_installer.sh
# download
# read -p "Enter the Download path: " target_path
# read -p "Enter the install path: " install_path

# mkdir ${install_path}

# wget -P ${target_path} https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
# wget -P ${target_path} https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
# wget -P ${target_path} https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz --no-check-certificate

# # unzip
# sudo tar -xzvf ${target_path}/libevent-2.1.11-stable.tar.gz -C ${install_path}
# sudo tar -xzvf ${target_path}/ncurses-6.2.tar.gz -C ${install_path}
# sudo tar -xzvf ${target_path}/tmux-3.0a.tar.gz -C ${install_path}
# sudo tar -xzvf libevent-2.1.11-stable.tar.gz -C ${install_path}
# sudo tar -xzvf ncurses-6.2.tar.gz -C ${install_path}
# sudo tar -xzvf tmux-3.0a.tar.gz -C ${install_path}
sudo tar -xzvf tmux-3.0a.tar.gz -C /usr/bin

#ncurses
# cd ${install_path}/ncur*
# sudo ./configure --prefix=/usr/bin
# sudo make && sudo make install

#libbevent
# cd ${install_path}/libevent*
# sudo ./configure --prefix=/usr/bin --disable-shared
# sudo make && sudo make install
# sudo ln -s /usr/lib64/libevent-*.so.* /usr/lib64/libevent.so
# sudo yum install -y libevent-dev
# sudo yum install libevent -y

#tmux
sudo apt install -y libevent-dev
sudo apt install -y libncurses5-dev

cd /usr/bin/tmux*
sudo ./configure --prefix=/usr/bin
sudo make && sudo make install
#CPPFLAGS="-I/my/path/tmux_depend//include -I/my/path/tmux_depend//include/ncurses" LDFLAGS="-static -L/my/path/tmux_depend//include -L/my/path/tmux_depend//include/ncurses -L/my/path/tmux_depend//lib"

tmux source ~/.tmux.conf
