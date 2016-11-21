#!/bin/bash

# Get the total size of a bucket
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

if [[ -f ~/.aws_session ]]; then
    . ~/.aws_session
else
    ~/lib/lumeris/aws/util/mf
fi
