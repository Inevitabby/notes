#!/usr/bin/env bash
cd "$(dirname "$0")" || exit

DIRECTORIES=(
    "cs1300"
    "cs1400"
    "cs2400"
    "cs2600"
    "cs2610"
    "cs2640"
    "cs3010"
    "cs3110"
    "cs3310"
    "cs3560"
    "cs3650"
    "cs4080"
    "cs4310"
    "cs4800"
    "cs50"
    "ffmpeg"
    "mat1150"
    "phl2020"
    "pls2010"
    "sta2260"
    "trans"
    "rust"
    "japan"
)

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
