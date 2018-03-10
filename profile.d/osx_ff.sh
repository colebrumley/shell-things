#!/bin/bash

# Start Firefox pointing to a SOCKS proxy running locally (like maybe from an SSH tunnel)
# Usage: ff [port] [profile]
# The port is optional and defaults to 8888
# The profile is also optional and defaults to the default profile
# shellcheck disable=SC2032
ff(){
    SOCKS_PORT="${1:-8888}"
    FF_PROFILE="${2:-"*.default"}"
    FF="/Applications/Firefox.app/Contents/MacOS/firefox"

    for f in $HOME/Library/Application\ Support/Firefox/Profiles/$FF_PROFILE/prefs.js; do
        for l in "user_pref(\"network.proxy.socks\", \"127.0.0.1\");" "user_pref(\"network.proxy.socks_port\", $SOCKS_PORT);" "user_pref(\"network.proxy.socks_remote_dns\", true);" "user_pref(\"network.proxy.type\", 1);"; do
            if ! grep -o "$l" "$f"; then
                echo "$l" >> "$f"
            fi
        done
        FF_PROFILE="$(dirname "$f")"
        break
    done
    # shellcheck disable=SC2033
    screen -d -S "ff" -m bash -c "$FF --profile \"$FF_PROFILE\""
}

export -f ff
