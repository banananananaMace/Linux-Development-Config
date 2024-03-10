#!/bin/bash
#!/bin/bash
# 下载 GCC 源代码
wget https://mirrors.aliyun.com/gnu/gcc/gcc-11.4.0/gcc-11.4.0.tar.gz
tar -xzvf gcc-11.4.0.tar.gz
cd gcc-11.4.0
# 下载依赖库
./contrib/download_prerequisites
# 配置和编译
mkdir build && cd build
../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib --enable-bootstrap --prefix=/usr/local/gcc-11
sudo make -j8
sudo make install
# 替换相关二进制程序
for i in $(ls /usr/local/gcc-11/bin); do
    test -f /usr/bin/$i && (mv /usr/bin/$i /usr/bin/$i.$(date +"%Y-%m-%dT%H:%M:%S") && ln -s /usr/local/gcc-11/bin/$i /usr/bin/$i || exit 21)
done
echo "GCC 11.4.0 已成功安装！"
