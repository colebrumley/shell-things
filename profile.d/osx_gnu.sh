#!/bin/sh
set -o allexport
# If on OSX and GNU coreutils is installed, use them over the BSD variants
[[ -d /usr/local/opt/coreutils/libexec/gnubin ]] && \
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
[[ -d /usr/local/opt/coreutils/libexec/gnuman ]] && \
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"