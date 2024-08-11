#!/bin/bash

rm -rf .repo/local_manifests/

# Init Rom Manifest
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Crdroid .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories  
# /opt/crave/resync.sh 
/opt/crave/resynctest.sh
 echo "====== resynctest Done ======="

# Export
export BUILD_USERNAME=FARHAN_SENSI
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

#Cherry-pick
cd vendor/addons
git fetch crdroid --unshallow
git fetch https://github.com/RisingTechOSS/android_vendor_addons fourteen
git cherry-pick dbd659e
cd ../..
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# lunch
lunch lineage_Mi439-ap2a-userdebug
make installclean
mka bacon
