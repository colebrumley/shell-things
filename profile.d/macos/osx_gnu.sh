#!/bin/bash

cfg_osx_gnu(){
    add_to_path "$GNU_BIN"
    MANPATH="${MANPATH//$GNU_MAN:/}"
    MANPATH="$GNU_MAN:$MANPATH"
    export MANPATH
}

if is_installed brew; then
    GNU_BIN="$BREW_PREFIX"/opt/coreutils/libexec/gnubin
    GNU_MAN="$BREW_PREFIX"/opt/coreutils/libexec/gnuman
    [[ -d "$GNU_BIN" ]] && cfg_osx_gnu
fi


# If on OSX and GNU coreutils is installed, use them over the BSD variants

