#!/bin/bash

# Helper func for writing something to STDERR
err() { >&2 echo "${@}"; }

# Helper func for bailing out of a script
err_out() { err "${@}"; exit 1; }

# Slightly better than `which`: http://unix.stackexchange.com/a/85250
is_installed() { command -v "${1}" >/dev/null 2>&1 || return 1; }

# Adds a directory to $PATH, making sure it's not duplicated
add_to_path() {
    local dir=$1
    PATH="${PATH//$dir:/}"
    PATH="$dir:$PATH"
    export PATH
}

# Set some standard color vars if this is an interactive session
if [[ $- == *i* ]] && is_installed tput; then
    fgRed=$(tput setaf 1)     fgGreen=$(tput setaf 2) \
    fgBlue=$(tput setaf 4)    fgCyan=$(tput setaf 6) \
    fgMagenta=$(tput setaf 5) fgYellow=$(tput setaf 3) \
    fgWhite=$(tput setaf 7)   fgBlack=$(tput setaf 0) \
    bgRed=$(tput setab 1)     bgGreen=$(tput setab 2) \
    bgBlue=$(tput setab 4)    bgCyan=$(tput setab 6) \
    bgMagenta=$(tput setab 5) bgYellow=$(tput setab 3) \
    bgWhite=$(tput setab 7)   bgBlack=$(tput setab 0) \
    tReset=$(tput sgr0)
    export  fgRed fgGreen fgBlue fgCyan fgMagenta fgYellow fgWhite fgBlack \
            bgRed bgGreen bgBlue bgBlack bgCyan bgMagenta bgYellow bgWhite bgBlack tReset
fi

OS=$(uname -s)
ARCH=$(uname -m)
VER=$(uname -r)

# PS1 is in the format `[ last_exit_code ] user@host:workdir`
# shellcheck disable=SC1117
[[ $SHELL == /bin/bash ]] && PS1="\[$fgGreen\][ \$? ] \u@\h\[$fgBlue\]\[$fgRed\]:\[$fgBlue\]\W\\$ \[$tReset\]"

# Add /usr/local/sbin to PATH
add_to_path /usr/local/sbin

# Add ~/bin to PATH
add_to_path "$HOME/bin"

export PATH OS ARCH VER PS1

# Export global funcs (for ease of bats testing)
export -f err err_out is_installed add_to_path

# Include ~/.profile.d/*, and let shellcheck ignore it
# shellcheck disable=SC1090
[[ -d ~/.profile.d ]] && for p in ~/.profile.d/*.sh; do . "$p"; done