#!/bin/bash
set -o allexport
GOPATH="$HOME/lib/go"
read -r PATH <<< "$(sed "s,$GOPATH/bin:,,g" <<< "$PATH")"
PATH="$GOPATH/bin:$PATH"