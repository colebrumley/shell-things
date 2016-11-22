#!/bin/bash

rpull() {
    local basedir=${1:-~/lib/lumeris}
    find "$basedir" -type d -name .git \
        -exec sh -c 'd="$(dirname "$1")";echo "Pulling $d";cd "$d" && git pull' _ {} \;
}