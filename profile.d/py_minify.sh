#!/bin/bash

minjson() {
    is_installed python || return 1
    if [ -t 0 ]; then
        # No stdin, read from file
        python -c 'import json, sys;json.dump(json.load(open(sys.argv[1])), sys.stdout, separators=(",", ":"))' "$1"
    else
        # Read from stdin
        python -c 'import json, sys;json.dump(json.load(sys.stdin), sys.stdout, separators=(",", ":"))'
    fi
}