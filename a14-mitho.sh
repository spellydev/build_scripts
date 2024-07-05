#!/bin/bash
rm -rf .repo/local_manifests/

#repo init rom
repo init -u https://github.com/NusantaraProject-ROM/android_manifest -b 11 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#Local manifests
git clone https://github.com/Gtajisan/local_manifests -b A11 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Export
export BUILD_USERNAME=FARHAN-MUH-TASIM
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TZ=Asia/Dhaka
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh 
echo "====== Envsetup Done ======="


# Lunch
lunch nad_Mi439_4_19-user 
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka nad
