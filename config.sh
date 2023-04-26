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
git config --global user.name banananaMace
git config --global user.email 421894173@qq.com
git config --global init.defaultBranch master
git config --global core.editor vim
git config --global color.ui true

#coredump 配置
ulimit -c unlimited
# su - root << EOF
# echo "core-%p-%e" > /proc/sys/kernel/core_pattern
# EOF

# zsh插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

