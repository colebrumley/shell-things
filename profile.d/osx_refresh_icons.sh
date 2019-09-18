#!/bin/bash

reset_icons() {
    sudo rm -rf /Library/Caches/com.apple.iconservices.store
    sudo killall Finder
    sudo killall Dock
}
