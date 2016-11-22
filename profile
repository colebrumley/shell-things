#!/bin/bash

# Helper func for writing something to STDERR
err() { >&2 echo "${@}"; }

# Helper func for bailing out of a script
err_out() { err "${@}"; exit 1; }

# Slightly better than `which`: http://unix.stackexchange.com/a/85250
is_installed() { command -v "${1}" >/dev/null 2>&1 || return 1; }

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
PS1="\[$fgGreen\][ \$? ] \u@\h\[$fgBlue\]\[$fgRed\]:\[$fgBlue\]\W\\$ \[$tReset\]"

# Add ~/bin to PATH
PATH="$HOME/bin:$PATH"

export PATH OS ARCH VER PS1

# Include ~/.profile.d/*, and let shellcheck ignore it
# shellcheck source=/dev/null
[[ -d ~/.profile.d ]] && for p in ~/.profile.d/*.sh; do . $p; done