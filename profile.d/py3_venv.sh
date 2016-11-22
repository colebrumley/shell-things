#!/bin/bash

PY3_PATH="$HOME/py3.5"
PY2_PATH="$HOME/py2.7"

setpy(){
    [ "$1" == "3" ] && VIRTUAL_ENV="$PY3_PATH"
    [ "$1" == "2" ] && VIRTUAL_ENV="$PY2_PATH"

    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}

setpy 3