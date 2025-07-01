#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias lll='ls -lah'