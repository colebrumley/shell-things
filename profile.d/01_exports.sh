#!/bin/bash

OS=$(uname -s)
ARCH=$(uname -m)
VER=$(uname -r)

# Add /usr/local/sbin to PATH
add_to_path /usr/local/sbin

# Add ~/bin to PATH
add_to_path "$HOME/bin"

# shellcheck disable=SC2155
if [[ -d /opt/homebrew ]]; then
    add_to_path "/opt/homebrew/bin"
    export BREW_PREFIX="$(brew --prefix)"
fi

# shellcheck disable=SC2155
if [[ -d /usr/local/Homebrew ]]; then
    add_to_path "/usr/local/Homebrew/bin"
    export BREW_PREFIX="$(brew --prefix)"
fi


export PATH OS ARCH VER

eval "$(pyenv init --path)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/cole/.cache/lm-studio/bin"
# End of LM Studio CLI section
