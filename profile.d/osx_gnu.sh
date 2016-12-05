#!/bin/bash
GNU_BIN=/usr/local/opt/coreutils/libexec/gnubin
GNU_MAN=/usr/local/opt/coreutils/libexec/gnuman

cfg_osx_gnu(){
    read -r PATH <<< $(sed "s,$GNU_BIN:,,g" <<< $PATH)
    read -r MANPATH <<< $(sed "s,$GNU_MAN:,,g" <<< $MANPATH)
    PATH="$GNU_BIN:$PATH"
    MANPATH="$GNU_MAN:$MANPATH"
    export PATH MANPATH
}

# If on OSX and GNU coreutils is installed, use them over the BSD variants
[[ -d $GNU_BIN ]] && cfg_osx_gnu
