#!/bin/bash

remote_reg_list() {
    local IMAGE=${1:-debian}
    local USER=${2}
    local URL=${3}
    wget -q "$URL/v1/repositories/$IMAGE/tags" -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'

}