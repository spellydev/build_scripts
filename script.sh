#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 --no-repo-verify -u https://github.com/AfterLifePrjkt13/android_manifest.git -b LTS -g default,-mips,-darwin,-notdefault
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

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"


# Set up build environment
#source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
. build/envsetup.sh
goafterlife Mi439_4_19 userdebug






