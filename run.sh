#!/usr/bin/env bash
set -eu
IFS=$'\n\t'

SCRIPT_DIR=$(realpath ${0%/*})

cd $SCRIPT_DIR/sdk
nohup ./emulator/emulator @my_android_emu &
sleep 2
adb root
adb push ../build/hello /data/bin/hello
adb shell "cd /data/bin; ./hello"
adb devices | grep emulator | cut -f1 | while read line; do adb -s $line emu kill; done
