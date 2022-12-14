#!/usr/bin/env bash

version="$1"

# use Homebrew's version of Bison because we need a newer version than what is shipped with MacOS
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# add openssl
openssl_path=$(brew --prefix openssl@1.1)
oniguruma_path=$(brew --prefix oniguruma)
icu_path=$(brew --prefix icu4c)
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${oniguruma_path}/lib/pkgconfig:${openssl_path}/lib/pkgconfig:${icu_path}/lib/pkgconfig"

if [ "$BUILD_DIR" == "" ]; then
    BUILD_DIR="$(pwd)/build/php-${version}"
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

make clean

./configure \
    --enable-bcmath \
    --enable-dom \
    --enable-exif \
    --enable-fileinfo \
    --enable-filter \
    --enable-fpm \
    --enable-intl \
    --enable-json \
    --enable-mbregex \
    --enable-mbstring \
    --enable-option-checking=fatal \
    --enable-simplexml \
    --enable-xml \
    --enable-xmlreader \
    --prefix="/opt/lightning-services/php-${version}" \
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
