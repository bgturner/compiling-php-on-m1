#!/usr/bin/env bash

# Xcode is required by Homebrew and is basically the same as build-essentials in Linux
echo "Checking Xcode installation location:"
xcode-select -p || xcode-select --install

# Apple Silicon defaults to /opt/homebrew
#   See: https://docs.brew.sh/Installation
homebrew_m1_location="/opt/homebrew"
[ ! -d $homebrew_m1_location ] && \
    echo "Homebrew installation not found in $homebrew_m1_location" \
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing dependencies with Homebrew"
# TODO: Install compiling deps
brew install \
     autoconf \
     bison \
     curl \
     gcc \
     libdv \
     libiconv \
     make \
     oniguruma \
     openssl@1.1 \
     pcre2 \
     re2c


