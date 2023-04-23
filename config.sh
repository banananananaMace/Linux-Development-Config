#!/bin/zsh

# vim fzf 安装
cd ~/.vim/plugin/fzf/ && ./install
cd ~

# vim YCM安装
python3 ~/.vim/plugged/YouCompleteMe/install.py
python3 ~/.vim/plugged/YouCompleteMe/third_party/ycmd/build.py
cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ~

# git 配置
git config --add oh-my-zsh.hide-status 1
git config --add oh-my-zsh.hide-dirty 1
git config --global user.name xudefu
git config --global user.email 1152699620@qq.com
git config --global init.defaultBranch master
git config --global core.editor vim
git config --global color.ui true

#coredump 配置
ulimit -c unlimited
# su - root << EOF
# echo "core-%p-%e" > /proc/sys/kernel/core_pattern
# EOF

