#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b udc-2-rising .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

echo "===== Cherry-pick stuff started ====="
cd packages/apps/Updater
git fetch rising --unshallow
git fetch https://github.com/Gtajisan/android_packages_apps_Updater fourteen
git cherry-pick 022c468
cd ../../..
echo "===== Cherry-pick Ended ====="

# keys
rm -rf vendor/lineage-priv
git clone https://github.com/Gtajisan/build_keys.git -b lin-keys vendor/lineage-priv
echo "============="
echo "Keys copied"
echo "============="


# Export
export BUILD_USERNAME=Gtajisan
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
riseup mi439 userdebug
rise b
