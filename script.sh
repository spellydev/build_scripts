#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b a14-matx .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Custom KeyGen
curl -O https://raw.githubusercontent.com/ofcsayan/Key-Gen-signed-script/main/generate_all_keys.sh
chmod +x generate_all_keys.sh
./generate_all_keys.sh
echo "============="
echo "Keys generate"
echo "============="

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_Mi439_4_19-ap1a-userdebug || lunch lineage_Mi439_4_19-userdebug
echo "============="
# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
