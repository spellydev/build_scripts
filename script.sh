#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b rise-b .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

cd .repo/repo
git pull -r
cd ../..

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Remove overrides
# Define a list of packages to remove
echo "===== Remove overrides started ====="

OVER_PACKAGES=("GoogleContacts" "GoogleDialer" "PrebuiltBugle" "dialer")
for PACKAGEU in "${OVER_PACKAGES[@]}"; do
find vendor/gms -name 'common-vendor.mk' -exec sed -i "/$PACKAGEU/d" {} \;
done
echo "===== Remove overrides Success ====="

# Export
export BUILD_USERNAME=FARHAN_UN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh 
echo "====== Envsetup Done ======="

# singed 
gk -s

# Lunch
riseup Mi439_4_19 userdebug
echo "============="

# Build rom
rise b

