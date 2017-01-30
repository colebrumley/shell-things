#!/bin/bash
if [[ -d /usr/local/etc/bash_completion.d ]]; then
    # shellcheck disable=SC1090
    for f in /usr/local/etc/bash_completion.d/*; do . "$f"; done
fi
