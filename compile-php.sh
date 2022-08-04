#!/usr/bin/env bash

# use Homebrew's version of Bison because we need a newer version than what is shipped with MacOS
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

if [ "$BUILD_DIR" == "" ]; then
    BUILD_DIR="$(pwd)/php-7.4.30"
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

./configure \
    --prefix=/opt/lightning-services/php-7.4.30 \
    --disable-all \
    --enable-bcmath \
    --enable-exif \
    --enable-fileinfo \
    --enable-filter \
    --enable-dom \
    --enable-json \
    --with-mysqli \
    --enable-simplexml \
    --enable-option-checking=fatal \
    --with-curl=$(brew --prefix curl) \
    --with-sodium \
    --with-libxml \
    --with-iconv=$(brew --prefix libiconv)
  

make -j $(nproc)
