#!/usr/bin/env bash

# use Homebrew's version of Bison because we need a newer version than what is shipped with MacOS
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

if [ "$BUILD_DIR" == "" ]; then
    BUILD_DIR="$(pwd)/php-7.4.30"
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

./configure \
    --disable-all \
    --enable-option-checking=fatal \
    --with-iconv=$(brew --prefix libiconv)
  

make -j $(nproc)
