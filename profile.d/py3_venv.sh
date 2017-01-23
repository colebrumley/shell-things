#!/bin/bash

setpy(){
    for d in $HOME/py*/bin; do 
        PATH="${PATH//$d:}"
    done
    VIRTUAL_ENV="$HOME/py$1"
    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}

setpy 3.5
