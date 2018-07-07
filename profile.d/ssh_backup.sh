#!/bin/bash

BACKUP_LOCATION=~/Documents/ssh_key_backup_encrypted.tar.gz
PREVIOUS_BACKUP="${BACKUP_LOCATION}.old"

KEY_LOCATION=/opt/secure/ssh_key_tar.password

backup_ssh(){
    if ! [[ -f $KEY_LOCATION ]]; then
        err password file not found
        return 1
    fi

    if [[ -f "$BACKUP_LOCATION" ]]; then
        rm -f "$PREVIOUS_BACKUP" || true
        mv "$BACKUP_LOCATION" "$PREVIOUS_BACKUP"
    fi

    cd ~/.ssh || return 1
    tar --exclude=./cm -czvf - ./* | openssl enc -e -aes256 \
        -k "$KEY_LOCATION" -out "$BACKUP_LOCATION"
}

restore_ssh(){
    if ! [[ -f $KEY_LOCATION ]]; then
        err password file not found
        return 1
    fi
    openssl enc -d -aes256 -k "$KEY_LOCATION" \
        -in "$BACKUP_LOCATION" | tar xvz -C ~/.ssh
}