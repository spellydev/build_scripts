#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://gitea.com/AfterLifeProject/manifest.git -b 14.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b afterlife .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

#  remove error 
rm -rf external/chromium-webview  
echo "======= remove Done ======"

#  fix error 
rm -rf external/chromium-webview  
echo "=======  Done ======"

# cherry-pick
cd build/make 
git fetch https://github.com/LineageOS/android_build refs/changes/82/390682/2 
git cherry-pick FETCH_HEAD
cd ../..
echo "======= cherry-pick Done ======"

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
goafterlife Mi439_4_19 userdebug
