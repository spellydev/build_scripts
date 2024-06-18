#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Phantm7/local_manifests_clo -b udc-2-rising .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# keys
rm -rf vendor/lineage-priv
git clone https://github.com/Phantm7/build_keys.git -b sup-keys vendor/lineage-priv
echo "============="
echo "Keys copied"
echo "============="

# Remove overrides
# Define a list of packages to remove
echo "===== Remove overrides started ====="

OVER_PACKAGES=("GoogleContacts" "GoogleDialer" "PrebuiltBugle")
for PACKAGEU in "${OVER_PACKAGES[@]}"; do
find vendor/gms -name 'common-vendor.mk' -exec sed -i "/$PACKAGEU/d" {} \;
done
echo "===== Remove overrides Success ====="

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
riseup mi439 userdebug
rise sb
