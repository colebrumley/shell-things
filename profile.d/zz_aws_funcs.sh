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
ssm_by_name() {
	local TARGET=
	readarray -t INSTANCES < <(aws ec2 describe-instances \
		--query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, InstanceId]' \
		--output text)
	local COLUMNS=40
	select option in "${INSTANCES[@]}"; do
		if [ 1 -le "$REPLY" ] && [ "$REPLY" -le ${#INSTANCES[@]} ]; then
			echo "Connecting to $(awk '{$NF=""; print $0}' <<<"$option")"
			read -r TARGET < <(awk '{print $NF}' <<<"$option")
			break
		else
			echo "Incorrect Input: '$REPLY'. Select a number 1-${#INSTANCES[@]}"
		fi
	done
	[[ -z $TARGET ]] || aws ssm start-session --target "$TARGET"
}
alias ssm=ssm_by_name
