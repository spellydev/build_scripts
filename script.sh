#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Matrixx-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN•2008
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

#Cherry-pick
cd vendor/addons
git fetch 14.0 --unshallow
git fetch https://github.com/RisingTechOSS/android_vendor_addons.git fourteen
git cherry-pick dbd659e
cd ../..
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

lunch lineage_Mi439_4_19-ap2a-userdebug
make installclean
mka bacon
