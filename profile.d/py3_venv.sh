#!/bin/bash

PY3_PATH="$HOME/py3.5"
PY2_PATH="$HOME/py2.7"

setpy(){
    read -r PATH <<< $(sed "s,$PY2_PATH/bin:,,g" <<< $PATH)
    read -r PATH <<< $(sed "s,$PY3_PATH/bin:,,g" <<< $PATH)
    [ "$1" == "3" ] && VIRTUAL_ENV="$PY3_PATH"
    [ "$1" == "2" ] && VIRTUAL_ENV="$PY2_PATH"
    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}

setpy 3