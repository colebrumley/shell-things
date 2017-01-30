#!/bin/bash
if [[ -d $HOME/lib/go ]]; then
    export GOPATH="$HOME/lib/go"
    add_to_path "$GOPATH/bin"
fi
