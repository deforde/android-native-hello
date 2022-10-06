#!/usr/bin/env bash
set -eu
IFS=$'\n\t'

SCRIPT_DIR=$(realpath ${0%/*})

cd $SCRIPT_DIR/sdk
nohup ./emulator/emulator @my_android_emu &
# TODO: this is a pretty flaky mechanism of waiting for the emu to be ready
sleep 5
# TODO: if adb was not already running as root, the first time you switch
# appears to cause the subsequent connect to fail?
./platform-tools/adb root
./platform-tools/adb push ../build/hello /data/bin/hello
./platform-tools/adb shell "cd /data/bin; ./hello"
./platform-tools/adb devices | grep emulator | cut -f1 | while read line; do ./platform-tools/adb -s $line emu kill; done
