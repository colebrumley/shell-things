#!/bin/bash

# Source all .sh files in ~/.profile.d
for file in ~/.profile.d/*.sh; do
    # shellcheck disable=SC1090
    . "$file"
done

# Include OS-specific profiles
if [[ "$(uname)" == "Darwin" ]]; then
    [[ -d ~/.profile.d/macos ]] && for p in ~/.profile.d/macos/*.sh; do . "$p"; done
else
    [[ -d ~/.profile.d/linux ]] && for p in ~/.profile.d/linux/*.sh; do . "$p"; done
fi

# Source all .sh files in ~/.profile.d/bash for bash-specific stuff
if [[ -n "$BASH_VERSION" ]]; then
    for file in ~/.profile.d/bash/*.sh; do
        # shellcheck disable=SC1090
        . "$file"
    done
fi