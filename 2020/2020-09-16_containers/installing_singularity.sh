#!/bin/bash
set -e

# Install dependencies available through apt-get:
sudo apt-get update
sudo apt-get install -y \
    build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev \
    wget pkg-config git cryptsetup-bin automake checkinstall zlib1g-dev libtbb-dev

# Install Go
## Another dependency for Singularity is the scripting language Go, and we'll need to manually install that:
export VERSION=1.13 OS=linux ARCH=amd64
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz
echo 'export PATH=/usr/local/go/bin:${PATH}:${HOME}/go/bin' >> ~/.bashrc
source ~/.bashrc
export PATH=/usr/local/go/bin:${PATH}:${HOME}/go/bin
go get -u github.com/golang/dep/cmd/dep

# Install Singularity
## Now, we're ready to install Singularity. We'll download it from Github,
## a repository for software and scripts linked to the "git" version control system.
git clone https://github.com/sylabs/singularity.git
cd singularity
git fetch
./mconfig
make -C ./builddir
sudo make -C ./builddir install
. /usr/local/etc/bash_completion.d/singularity
cd ..
