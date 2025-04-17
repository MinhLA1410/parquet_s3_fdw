#!/bin/bash

VERSION="$1"

INSTALL_DIR="/tmp/arrow"
CONFIGURE_OPTIONS="-DBUILD_SHARED_LIBS=ON -DARROW_PARQUET=ON -DARROW_WITH_SNAPPY=ON -DARROW_WITH_ZSTD=ON"

echo "ARROW ver \"$VERSION\", install to \"$INSTALL_DIR\" with options \"$CONFIGURE_OPTIONS\"";

adr="https://github.com/apache/arrow.git"
echo "ARROW source code: $adr"
git clone "$adr" $INSTALL_DIR
cd $INSTALL_DIR
git checkout -b apache-arrow-$VERSION refs/tags/apache-arrow-$VERSION
git submodule update --init --recursive
mkdir -p cpp/release
cd cpp/release
cmake .. $CONFIGURE_OPTIONS .

make
echo "----- ARROW INSTALL directory $INSTALL_DIR -----"
sudo make install

echo "/usr/local/lib64" | sudo tee /etc/ld.so.conf.d/custom-lib64.conf
sudo ldconfig
