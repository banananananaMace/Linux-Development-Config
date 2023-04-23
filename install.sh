#########################################################################
# File Name: install.sh
# Author: 10340400
# mail: xu.defu@zte.com
# Created Time: 2023年04月21日 星期五 09时28分15秒
#########################################################################
#!/bin/bash

echo "it will take some time, please wait"
if which apt-get >/dev/null; then
	# sudo apt-get install -y vim
	sudo apt-get install -y vim-gnome
	sudo apt-get install -y python3
	sudo apt-get install -y python-setuptools
	sudo apt-get install -y python3-dev
	sudo apt-get install -y ctags
	sudo apt-get install -y cscope
	sudo apt-get install -y xclip
	sudo apt-get install -y zsh
	sudo apt-get install -y astyle
	sudo apt-get install -y git
	# sudo apt-get install -y tmux
	sudo apt-get install -y gdb
	sudo apt-get install -y gcc
	sudo apt-get install -y cmake
	sudo apt-get install -y g++

elif which yum >/dev/null; then
	# sudo yum install -y vim
	sudo yum install -y python3
	sudo yum install -y ctags
	sudo yum install -y astyle
	sudo yum install -y vim-gnome
	sudo yum install -y python-setuptools
	sudo yum install -y python3-devel
	sudo yum install -y cscope
	sudo yum install -y xclip
	sudo yum install -y zsh
	sudo yum install -y git
	# sudo yum install -y tmux
	sudo yum install -y gdb
	sudo yum install -y gcc
	sudo yum install -y g++
	sudo yum install -y cmake
fi

# Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
	echo "You are using HomeBrew tool"
	brew install vim ctags git astyle
fi


sudo rm -rf /usr/local/bin/ctags
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

# 打上oh-my-zsh离线安装补丁
git am -3 0001-offline-patch.patch

# 复制配置文件
sudo rm -rf backup && mkdir backup
sudo mv -f ~/.zshrc backup
sudo mv -f ~/.tmux.conf backup
sudo mv -f ~/.vim backup
sudo mv -f ~/.vimrc backup
sudo mv -f ~/.oh-my-zsh backup

sudo chmod 777 * -R
cp -r .vim* ~
cp -r .zsh* ~
cp -r .fzf* ~
cp -r .tmux.conf ~
cp -r .oh-my-zsh ~


# 插件安装
echo "plugs are installing..." > log.txt
vim log.txt -c "PlugInstall" -c "q" -c "q"
rm -rf log.txt

# zsh安装
sh -x ~/.oh-my-zsh/tools/install.sh


echo "done"

