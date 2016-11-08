#!/bin/bash

bucketsize() {
    local bucket=${1:-rundeck-execution-log-storage}
    echo "Pulling stats..."
    bytes=$(aws s3api list-objects \
        --bucket $bucket \
        --output json \
        --query "sum(Contents[].Size)")
    mb=$(echo $bytes/1024/1024 | bc)
    echo "$bucket is using $mb Mb"
}