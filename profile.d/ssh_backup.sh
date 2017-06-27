#!/bin/bash

BACKUP_LOCATION=~/Drive/ssh_key_backup_encrypted.tar.gz
PREVIOUS_BACKUP="${BACKUP_LOCATION}.old"


backup_ssh(){
    if [[ -f "$BACKUP_LOCATION" ]]; then
        rm -f "$PREVIOUS_BACKUP" || true
        mv "$BACKUP_LOCATION" "$PREVIOUS_BACKUP"
    fi

    cd ~/.ssh || return 1
    tar --exclude=./cm -czvf - ./* | openssl enc -e -aes256 \
        -k /opt/secure/ssh_key_tar.password -out "$BACKUP_LOCATION"
}

restore_ssh(){
    openssl enc -d -aes256 -k /opt/secure/ssh_key_tar.password \
        -in "$BACKUP_LOCATION" | tar xvz -C ~/.ssh
}