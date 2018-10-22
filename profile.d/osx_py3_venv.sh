#!/bin/bash

# I use setpy as a replacement for virtualenv's bin/activate script.
# setpy is expecting python virtualenv directories to be in the home
# directory and named like ~/pyVERSION (i.e. ~/py2, ~/py3.6, etc).
# Then, you just need to use `setpy VERSION` to enable a specific version
# without all the bin/activate garbage.

setpy(){
    for d in "$HOME"/py*/bin; do 
        PATH="${PATH//$d:}"
    done
    VIRTUAL_ENV="$HOME/py$1"
    PATH="$VIRTUAL_ENV/bin:$PATH"
    export VIRTUAL_ENV PATH
    unset PYTHON_HOME
}
export -f setpy

pypip_bak(){
    local THISPY
    THISPY="$(python -V 2>&1 | awk '{print $2}')"
    pip freeze > "$HOME/lib/bak/python${THISPY:0:1}_pip_freeze.txt"
}
export -f pypip_bak

pypip_update(){
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
export -f pypip_update

pyupdate_brew(){
    for ver in $(brew list --versions | grep "^python" | awk '{$1=""; print $0}'); do
        local major_version=${ver:0:1}
        if [[ -d "$HOME/lib/py$ver" ]]; then
            echo Python "$ver" is already configured
        else
            if [[ $major_version == 2 ]]; then
                src_str="/usr/local/Cellar/python@$major_version/$ver/bin/python$major_version"
            else
                src_str="/usr/local/Cellar/python$major_version/$ver/bin/python$major_version"
            fi
            /usr/local/bin/virtualenv -p "$src_str" "$HOME/lib/py$ver"
            ln -s "$HOME/lib/py$ver" "$HOME/py$ver"
            setpy "$ver"
            pip install -r "$HOME/lib/bak/python${major_version}_pip_freeze.txt"
        fi
    done
}
export -f pyupdate_brew

[[ -d $HOME/py3/bin ]] && setpy 3
