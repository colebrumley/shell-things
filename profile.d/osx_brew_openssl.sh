#!/bin/bash

cfg_openssl() {
    [[ -h /usr/local/lib/libcrypto.dylib ]] || ln -s /usr/local/opt/openssl@1.1/lib/libcrypto.dylib /usr/local/lib/
    [[ -h /usr/local/lib/libssl.dylib ]] || ln -s /usr/local/opt/openssl@1.1/lib/libssl.dylib /usr/local/lib/
    add_to_path /usr/local/opt/openssl@1.1/bin
}

is_installed brew && cfg_openssl
