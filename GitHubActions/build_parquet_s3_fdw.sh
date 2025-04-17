#!/bin/bash

VERSION="$1"

mkdir -p ./workdir/postgresql-${VERSION}/contrib/parquet_s3_fdw
tar zxf ./parquet_s3_fdw.tar.gz -C ./workdir/postgresql-${VERSION}/contrib/parquet_s3_fdw/
cd ./workdir/postgresql-${VERSION}/contrib/parquet_s3_fdw

# show locally compiled library
ls -la /usr/local/lib

sudo make install
