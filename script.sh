#!/bin/bash

rm -rf .repo/local_manifests/


# repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14 --git-lfs
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
export BUILD_USERNAME=derpshit
export BUILD_HOSTNAME=crave
echo "============="

# Set up build environment
source build/envsetup.sh
echo "======================================"
echo "im crave sir you rom sync Done ok bye "
echo "======================================"

# Lunch
lunch derp_Mi439_4_19-ap2a-userdebug 
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka derp
