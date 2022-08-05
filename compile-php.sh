#!/usr/bin/env bash

# use Homebrew's version of Bison because we need a newer version than what is shipped with MacOS
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# add openssl
openssl_path=$(brew --prefix openssl@1.1)
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${openssl_path}/lib/pkgconfig"

if [ "$BUILD_DIR" == "" ]; then
    BUILD_DIR="$(pwd)/php-7.4.30"
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

make clean

./configure \
    --disable-all \
    --enable-bcmath \
    --enable-dom \
    --enable-exif \
    --enable-fileinfo \
    --enable-filter \
    --enable-json \
    --enable-option-checking=fatal \
    --enable-simplexml \
    --enable-xml \
    --enable-xmlreader \
    --prefix=/opt/lightning-services/php-7.4.30 \
    --with-curl=$(brew --prefix curl) \
    --with-external-pcre=$(brew --prefix pcre2) \
    --with-iconv=$(brew --prefix libiconv) \
    --with-libxml \
    --with-mysqli \
    --with-openssl-dir="${openssl_path}/bin" \
    --with-openssl="${openssl_path}/bin"  \
    --with-sodium \
    --with-zip \
    --with-zlib

  

make -j $(nproc)
