#!/bin/bash

rpull() {
    local basedir=${1:-~/lib/lumeris}
    find $basedir -type d -name .git \
        -exec sh -c 'd=$(dirname {});echo "Pulling $d";cd $d && git pull' \;
}