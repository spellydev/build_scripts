#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Pixel-OS .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories   
/opt/crave/resynctest.sh
echo "====== resynctest Done ======="

# Export
export BUILD_USERNAME=FARHAN_SENSI
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch aosp_Mi439_4_19-ap2a-userdebug
make installclean
mka bacon
