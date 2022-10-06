#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(realpath ${0%/*})

BUILD_DIR=$SCRIPT_DIR/build
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR
ANDROID_NDK_DIR=$SCRIPT_DIR/android-ndk-r25b
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_DIR/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86_64 ..
cmake --build . -j 7
