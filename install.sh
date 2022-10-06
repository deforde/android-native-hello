#!/usr/bin/env bash
set -eu
IFS=$'\n\t'

SCRIPT_DIR=$(realpath ${0%/*})
SDK_DIR=$SCRIPT_DIR/sdk
mkdir -p $SDK_DIR

curl -LO https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip commandlinetools-linux-8512546_latest.zip
rm commandlinetools-linux-8512546_latest.zip
cd cmdline-tools/bin
yes | ./sdkmanager --sdk_root=$SDK_DIR "platform-tools" "platforms;android-28"
yes | ./sdkmanager --sdk_root=$SDK_DIR --install emulator
yes | ./sdkmanager --sdk_root=$SDK_DIR "system-images;android-28;default;x86_64"
yes | ./sdkmanager --sdk_root=$SDK_DIR --licenses
./avdmanager create avd -n my_android_emu -k "system-images;android-28;default;x86_64"
