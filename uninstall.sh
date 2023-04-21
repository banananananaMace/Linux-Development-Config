#!/bin/bash

echo "it will take some time, please wait"
if which apt-get >/dev/null; then
	sudo apt-get remove -y vim vim-gnome
	sudo apt-get remove -y python3 python-setuptools python-dev
	sudo apt-get remove -y ctags cscope xclip zsh
	sudo apt-get remove -y astyle git tmux gdb

elif which yum >/dev/null; then
	sudo yum remove -y vim vim-gnome
	sudo yum remove -y python3 python-setuptools python-dev
	sudo yum remove -y ctags cscope xclip zsh
	sudo yum remove -y astyle git tmux gdb
fi

rm -rf ~/.vim*
rm -rf ~/.oh-my-zsh
rm -rf ~/.tmux.conf
rm -rf ~/.ycm_extra_conf.py
rm -rf ~/.fzf.*
rm -rf ~/.zsh*
