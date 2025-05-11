#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
source .util/convert.sh
source .util/cleanup.sh

# 1. Oneshot mode
[[ $1 == "-o" ]] && cleanup

# 2. Daemon mode
printf "\e[1;32mConversion daemon is running...\e[0m\n"
while $RUNNING; do
	convert
	sleep 1
done
