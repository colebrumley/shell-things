#!/bin/bash

PY2_PATH=/c/Python27
PY3_PATH=/c/Users/cb232h/AppData/Local/Programs/Python/Python36-32

setpy() {
    case $1 in
        2)
            add_to_path $PY2_PATH
        ;;
        3)
            add_to_path $PY3_PATH
        ;;
    esac
}
