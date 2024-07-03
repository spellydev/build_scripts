#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs

echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Alpha-droid .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# keys
git clone https://github.com/PhantomEnigma/build_keys.git -b blaze-keys vendor/extra
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
lunch lineage_Mi439_4_19-userdebug || lunch lineage_Mi439_4_19-userdebug
echo "============="
# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
