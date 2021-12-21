#!/bin/bash

cfg_openssl() {
    [[ -h "$BREW_PREFIX"/lib/libcrypto.dylib ]] || ln -s "$BREW_PREFIX"/opt/openssl@1.1/lib/libcrypto.dylib "$BREW_PREFIX"/lib/
    [[ -h "$BREW_PREFIX"/lib/libssl.dylib ]] || ln -s "$BREW_PREFIX"/opt/openssl@1.1/lib/libssl.dylib "$BREW_PREFIX"/lib/
    add_to_path "$BREW_PREFIX"/opt/openssl@1.1/bin
}

is_installed brew && cfg_openssl
