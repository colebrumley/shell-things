#!/bin/bash

link_openssl_stuff(){
    ln -s /usr/local/opt/openssl/lib/libcrypto.dylib /usr/local/lib/
    ln -s /usr/local/opt/openssl/lib/libssl.dylib /usr/local/lib/
    ln -s /usr/local/Cellar/openssl/1.0.2l/bin/openssl "$HOME/bin/openssl"
}

cfg_openssl() {
    if ! [[ "$(brew ls --versions|grep ^openssl|awk '{print $2}')" =~ ^1.0.2 ]];
    then brew update && brew install openssl; fi

    [[ -h /usr/local/lib/libcrypto.dylib ]] || link_openssl_stuff
}

is_installed brew && cfg_openssl
