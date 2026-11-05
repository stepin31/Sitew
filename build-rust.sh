#!/usr/bin/env bash
# Собирает libobhod_core.so под Android в android/app/src/main/jniLibs
set -e
rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android
cargo install cargo-ndk
cd core
cargo ndk -t arm64-v8a -t armeabi-v7a -t x86_64 -o ../android/app/src/main/jniLibs build --release
