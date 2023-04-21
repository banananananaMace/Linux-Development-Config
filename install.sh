#########################################################################
# File Name: install.sh
# Author: 10340400
# mail: xu.defu@zte.com
# Created Time: 2023年04月21日 星期五 09时28分15秒
#########################################################################
#!/bin/bash

echo "it will take some time, please wait"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome
	sudo apt-get install -y python3 python-setuptools python-dev
	sudo apt-get install -y ctags cscope xclip zsh
	sudo apt-get install -y astyle git tmux gdb

elif which yum >/dev/null; then
	sudo yum install -y vim vim-gnome
	sudo yum install -y python3 python-setuptools python-dev
	sudo yum install -y ctags cscope xclip zsh
	sudo yum install -y astyle git tmux gdb
fi

# Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
	echo "You are using HomeBrew tool"
	brew install vim ctags git astyle
fi

sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

# 复制配置文件
mkdir backup
mv -f ~/.zshrc backup
mv -f ~/.tmux.conf backup
mv -f ~/.vim backup
mv -f ~/.vimrc backup
mv -f ~/.oh-my-zsh backup

mv -f .* $HOME

# zsh安装
chmod 777 ~/.oh-my-zsh/tools/install.sh && sh -x ~/.oh-my-zsh/tools/install.sh

# 插件安装
echo "plugs are installing..." > log.txt
vim log.txt -c "BundleInstall" -c "q" -c "q"
rm -rf log.txt

# vim fzf安装
sh -x $/HOME/.vim/plugin/fzf/install.sh

# vim YCM安装
python3 $/HOME/.vim/plugged/YouCompleteMe/install.py
python3 $/HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/build.py
cp $/HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py $HOME

echo "done"

