#!/bin/bash

VERSION="$1"

INSTALL_DIR="/tmp/aws-sdk-cpp"
CONFIGURE_OPTIONS="-DBUILD_ONLY="s3""

echo "AWS SDK CPP ver \"$VERSION\", install to \"$INSTALL_DIR\" with options \"$CONFIGURE_OPTIONS\"";

sudo apt update
sudo apt install -y \
        libcurl4-openssl-dev \
        libssl-dev \
        uuid-dev \
        libpulse-dev \
        libzstd-dev

adr="https://github.com/aws/aws-sdk-cpp.git"
echo "AWS SDK CPP source code: $adr"
git clone "$adr" $INSTALL_DIR
cd $INSTALL_DIR
git checkout -b $VERSION refs/tags/$VERSION
git submodule update --init --recursive
cmake $CONFIGURE_OPTIONS .

make
echo "----- AWS SDK CPP INSTALL directory $INSTALL_DIR -----"
sudo make install



