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

# Cherry-pick stuff

# usb notification fix
cd frameworks/base
git fetch superior --unshallow
git fetch https://github.com/DerpFest-AOSP/frameworks_base 14
git cherry-pick 56dc92f
cd ../..


# keys

git clone https://github.com/Phantm7/build_keys.git -b sup-keys vendor/superior-priv
echo "============="
echo "Keys copied"
echo "============="

# Signing
#git clone https://github.com/Phantm7/android_vendor_superior-priv_keys-template.git vendor/superior-priv/keys 
#cd vendor/superior-priv/keys
#./gen_keys
#cd ../../..

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave
echo "====== Export success ======="

# Set up build environment
source build/envsetup.sh
echo "======= ENV setup success ======"
# Setup Git LFS
# repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Lunch
lunch superior_mi439-ap1a-userdebug || lunch superior_mi439-userdebug || breakfast mi439
make installclean
mka bacon || m bacon
