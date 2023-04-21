#!/bin/bash

echo "it will take some time, please wait"
if which apt-get >/dev/null; then
	sudo apt-get remove -y vim vim-gnome gcc g++
	sudo apt-get remove -y python3 python-setuptools python3-dev
	sudo apt-get remove -y ctags cscope xclip zsh
	sudo apt-get remove -y astyle git tmux gdb gcc g++ cmake

elif which yum >/dev/null; then
	sudo yum remove -y vim vim-gnome
	sudo yum remove -y python3 python-setuptools python-dev
	sudo yum remove -y ctags cscope xclip zsh
	sudo yum remove -y astyle git tmux gdb gcc g++ cmake
fi

sudo rm -rf ~/.vim*
sudo rm -rf ~/.oh-my-zsh
sudo rm -rf ~/.tmux.conf
sudo rm -rf ~/.ycm_extra_conf.py
sudo rm -rf ~/.fzf.*
sudo rm -rf ~/.zsh*
