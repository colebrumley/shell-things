#!/bin/bash

PY3_PATH="$HOME/py3.5"
PY2_PATH="$HOME/py2.7"

setpy(){
    for p in "$PY2_PATH/bin:" "$PY3_PATH/bin:"; do
        PATH="${PATH//$p/}"
    done
    [ "$1" == "3" ] && VIRTUAL_ENV="$PY3_PATH"
    [ "$1" == "2" ] && VIRTUAL_ENV="$PY2_PATH"
    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}

setpy 3