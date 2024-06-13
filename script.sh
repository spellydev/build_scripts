#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/SuperiorOS/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Phantm7/local_manifests_clo -b udc-2-superior .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave
echo "============="

# Set up build environment
source build/envsetup.sh
echo "============="
# Setup Git LFS
# repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Lunch
lunch superior_mi439-ap1a-userdebug || lunch superior_mi439-userdebug || breakfast mi439
mka bacon || m bacon
