#!/bin/bash

rm -rf .repo/local_manifests/


# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b a14-matx .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"


# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_Mi439_4_19-ap2a-userdebug || lunch lineage_Mi439_4_19-userdebug
echo "============="
# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
