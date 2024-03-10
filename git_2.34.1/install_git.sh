#!/bin/bash

if which apt-get >/dev/null; then
	# sudo apt-get install -y git
	sudo apt-get install -y aptitude
	sudo aptitude install -y libssl-dev
	sudo apt-get install -y zlib1g-dev
	sudo apt-get install -y libcurl4-openssl-dev
	sudo apt-get install -y libexpat1-dev
	sudo apt-get install -y git-gui
	sudo apt-get install -y gettext

elif which yum >/dev/null; then
	sudo yum install -y install libcurl-devel
	sudo yum install -y expat-devel
	sudo yum install -y curl-devel
	sudo yum install -y openssl-devel
	sudo yum install -y zlib-devel
	sudo yum install -y gcc
	sudo yum install -y perl-ExtUtils-MakeMaker
fi

# wget https://www.kernel.org/pub/software/scm/git/git-2.34.1.tar.gz
cd git
tar zxvf git-2.34.1.tar.gz
cd git-2.34.1
sudo make prefix=/usr/local/git all
sudo make prefix=/usr/local/git install
sudo ln -fs /usr/local/git/bin/* /usr/bin
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/profile
source /etc/profile

