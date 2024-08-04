#!/bin/bash

rm -rf .repo/local_manifests/

# Init Rom Manifest
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Crdroid .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

cd .repo/repo
git pull -r
cd ../..

# Sync the repositories  
# /opt/crave/resync.sh 
/opt/crave/resynctest.sh
 echo "====== resynctest Done ======="

# Set up build environment
export BUILD_USERNAME=FARHAN 
export BUILD_HOSTNAME=crave 
echo "======= Export Done ======"

# Signing (credits sale)
curl -O https://raw.githubusercontent.com/Gtajisan/crDroid-build-signed-script/crdroid/create-signed-env.sh
chmod +x create-signed-env.sh
./create-signed-env.sh
echo "====== signing Done ======="

#Cherry-pick
cd vendor/addons
git fetch 14.0 --unshallow
git fetch https://github.com/AfterlifeOS/vendor_afterlife.git 14
git cherry-pick dbd659e
cd ../..

# Remove overrides
# Define a list of packages to remove
echo "===== Remove overrides started ====="

OVER_PACKAGES=("GoogleContacts" "GoogleDialer" "PrebuiltBugle" "dialer")
for PACKAGEU in "${OVER_PACKAGES[@]}"; do
find vendor/gms -name 'common-vendor.mk' -exec sed -i "/$PACKAGEU/d" {} \;
done
echo "===== Remove overrides Success ====="

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

lunch lineage_Mi439-ap2a-userdebug
make installclean
mka bacon
