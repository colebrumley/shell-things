#!/bin/bash

# Get the total size of a bucket
bucketsize() {
	local bucket=${1:-rundeck-execution-log-storage}
	# echo "Pulling stats..."
	bytes=$(aws s3api list-objects \
		--bucket "$bucket" \
		--output json \
		--query "sum(Contents[].Size)")
	mb=$(echo "$bytes/1024/1024" | bc)
	echo "$mb Mb"
}

ae() { printenv | grep AWS; }
alias awsenv=ae

#shellcheck disable=2016
ssm() {
    local TARGET=
    if [[ -n "$ZSH_VERSION" ]]; then
        local INSTANCES
        INSTANCES=("${(@f)$(aws ec2 describe-instances \
            --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, InstanceId]' \
            --output text)}")
    else
        readarray -t INSTANCES < <(aws ec2 describe-instances \
            --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, InstanceId]' \
            --output text)
    fi
    local COLUMNS=40
    select option in "${INSTANCES[@]}"; do
        if [ 1 -le "$REPLY" ] && [ "$REPLY" -le ${#INSTANCES[@]} ]; then
            echo "Connecting to $(awk '{$NF=""; print $0}' <<<"$option")"
            if [[ -n "$ZSH_VERSION" ]]; then
                TARGET=$(awk '{print $NF}' <<<"$option")
            else
                read -r TARGET < <(awk '{print $NF}' <<<"$option")
            fi
            break
        else
            echo "Incorrect Input: '$REPLY'. Select a number 1-${#INSTANCES[@]}"
        fi
    done
    [[ -z $TARGET ]] || aws ssm start-session --target "$TARGET"
}
