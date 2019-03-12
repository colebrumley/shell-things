#!/bin/bash

git_scrub(){
    # Prune old branches
    git remote prune origin
    # Delete local copies of branches that are gone from the remote
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d
}

rpull() {
    local basedir=${1}
    # shellcheck disable=SC2016
    find "$basedir" -type d -name .git \
        -exec sh -c 'd="$(dirname "$1")";echo "Pulling $d";cd "$d" && git pull' _ {} \;
}
