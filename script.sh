#!/bin/bash

rm -rf .repo/local_manifests/


# repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14
echo "=============================="
echo "gay DerpFest Repo init success"
echo "=============================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b 14/derp .repo/local_manifests
echo "========================================="
echo "Fuckin# shit Local manifest clone success"
echo "========================================="

# build
/opt/crave/resync.sh
echo "======================"
echo "Sync successfully Done"
echo "======================"

# Export
export BUILD_USERNAME=FARHAN_shit
export BUILD_HOSTNAME=crave
echo "============="

# Set up build environment
source build/envsetup.sh
echo "======================================"
echo "im craven Farhan sir you rom sync Done"
echo "======================================"
# Setup Git LFS
# repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Lunch
lunch derp_mi439-ap1a-userdebug || lunch derp_mi439-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka derp
