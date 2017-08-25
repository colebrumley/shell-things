#!/bin/bash

# I use setpy as a replacement for virtualenv's bin/activate script.
# setpy is expecting python virtualenv directories to be in the home
# directory and named like ~/pyVERSION (i.e. ~/py2, ~/py3.6, etc).
# Then, you just need to use `setpy VERSION` to enable a specific version
# without all the bin/activate garbage.

setpy(){
    for d in $HOME/py*/bin; do 
        PATH="${PATH//$d:}"
    done
    VIRTUAL_ENV="$HOME/py$1"
    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}

[[ -d $HOME/py3/bin ]] && setpy 3
