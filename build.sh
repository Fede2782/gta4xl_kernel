#!/bin/bash

export PATH=$(pwd)/toolchain/clang/host/linux-x86/clang-r487747c/bin:$PATH
export CROSS_COMPILE=$(pwd)/toolchain/clang/host/linux-x86/clang-r487747c/bin/aarch64-linux-gnu-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r487747c/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export PLATFORM_VERSION=13
export TARGET_BUILD_VARIANT=user

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 clean && make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 mrproper
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 exynos9611-gta4xl_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y LLVM=1 LLVM_IAS=1 -j4

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
