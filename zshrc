#!/bin/zsh

# Load the shell profile
source "${HOME}/.profile"

# Source all .sh files in ~/.profile.d/zsh for zsh-specific stuff
if [[ -n "$ZSH_VERSION" ]]; then
    for file in ~/.profile.d/zsh/*.sh; do
        # shellcheck disable=SC1090
        . "$file"
    done
fi
