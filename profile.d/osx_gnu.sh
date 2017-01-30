#!/bin/bash
GNU_BIN=/usr/local/opt/coreutils/libexec/gnubin
GNU_MAN=/usr/local/opt/coreutils/libexec/gnuman

cfg_osx_gnu(){
    add_to_path "$GNU_BIN"
    MANPATH="${MANPATH//$GNU_MAN:/}"
    MANPATH="$GNU_MAN:$MANPATH"
    export MANPATH
}

# If on OSX and GNU coreutils is installed, use them over the BSD variants
[[ -d "$GNU_BIN" ]] && cfg_osx_gnu
