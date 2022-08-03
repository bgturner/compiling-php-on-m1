#!/usr/bin/env bash

# use Homebrew's version of Bison because we need a newer version than what is shipped with MacOS
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

if [ "$BUILD_DIR" == "" ]; then
    BUILD_DIR="$(pwd)/build/php-src-master"
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

./configure --disable-all

make -j $(nproc)
