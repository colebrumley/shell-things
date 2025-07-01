#!/bin/bash

# PS1 is in the format `[ last_exit_code_emoji ] user@host:workdir`
# shellcheck disable=SC1117
[[ $SHELL =~ /bash$ ]] && PS1="\[$fgGreen\][ \$(exit_code_emojifier) ] \u@\h\[$fgBlue\]\[$fgRed\]:\[$fgBlue\]\W\\$ \[$tReset\]"

