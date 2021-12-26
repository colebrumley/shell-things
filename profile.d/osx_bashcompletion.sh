#!/bin/bash
if is_installed brew; then
    if [[ -d "$BREW_PREFIX"/etc/bash_completion.d ]] && [[ $SHELL =~ /bash$ ]]; then
        # shellcheck disable=SC1090
        for f in "$BREW_PREFIX"/etc/bash_completion.d/*; do . "$f"; done
    fi
fi
