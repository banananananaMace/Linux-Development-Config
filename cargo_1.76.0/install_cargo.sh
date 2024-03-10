#!/bin/bash
# 安装 cargo
# sudo apt-get install -y cargo
# # 获取当前安装的 cargo 版本
# installed_version=$(cargo --version | awk '{print $2}')
# # 比较版本号
# required_version="1.75.0"
# if [[ "$(printf '%s\n' "$installed_version" "$required_version" | sort -V | head -n1)" != "$required_version" ]]; then
    # echo "当前安装的 cargo 版本低于 $required_version，将执行 rustup-init.sh 脚本更新 cargo。"
    # # 使用清华大学镜像源下载并运行 rustup-init.sh
    # export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    # export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# else
    # echo "当前安装的 cargo 版本已经满足要求。"
# fi

# 使用清华大学镜像源安装 rust
RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install stable

# 修改 cargo 源为清华源
echo "正在修改 cargo 源为清华源..."
mkdir -vp ${CARGO_HOME:-$HOME/.cargo}
config_file=~/.cargo/config
cat << EOF > "$config_file"
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

[source.crates-io]
replace-with = 'tuna'
EOF
echo "已成功将 cargo 源修改为清华源。"

# 安装 alacritty 其他依赖
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cd ../alacritty && cargo build --release
target_dir=$(pwd)
# 创建桌面图标
if [ -f "${target_dir}/target/release/alacritty" ]; then
    echo "找到 alacritty 文件，将执行复制操作..."
    sudo cp target/release/alacritty /usr/local/bin # 或者您希望的其他 $PATH 目录
    echo "已成功复制 alacritty 到 /usr/local/bin 或其他指定目录。"
    # 复制 alacritty 图标
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    # 安装 Alacritty 的桌面文件
    sudo desktop-file-install extra/linux/Alacritty.desktop
    # 更新桌面数据库
    sudo update-desktop-database
    # 将 alacritty 设置成默认终端
    sudo update-alternatives --config x-terminal-emulator
else
    echo "未找到 alacritty 文件。请检查构建是否成功。"
    exit 1
fi


# 其他支持
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

mkdir -p ~/.config/alacritty && cp alacritty.yml ~/.config/alacritty
