#!/bin/bash

# Get the total size of a bucket
bucketsize() {
    local bucket=${1:-rundeck-execution-log-storage}
    echo "Pulling stats..."
    bytes=$(aws s3api list-objects \
        --bucket "$bucket" \
        --output json \
        --query "sum(Contents[].Size)")
    mb=$(echo "$bytes/1024/1024" | bc)
    echo "$bucket is using $mb Mb"
}

# This checks for an AWS MFA session and reruns the auth script if it doesn't exist
if [[ -f ~/.aws_session ]]; then 
    # shellcheck disable=SC1090
    . ~/.aws_session
else
    f=~/lib/lumeris/aws/util/mf
    [[ -f $f ]] && $f
fi
