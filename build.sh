#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(realpath ${0%/*})

curl -LO https://dl.google.com/android/repository/android-ndk-r25b-linux.zip
unzip android-ndk-r25b-linux.zip
rm android-ndk-r25b-linux.zip
ANDROID_NDK_DIR=$SCRIPT_DIR/android-ndk-r25b

BUILD_DIR=$SCRIPT_DIR/build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_DIR/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86_64 ..
cmake --build . -j 7
