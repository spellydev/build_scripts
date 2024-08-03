
#!/bin/bash

rm -rf .repo/local_manifests/

repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b afterlife .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

#Cherry-pick
cd vendor/addons
git fetch 14.0 --unshallow
git fetch https://github.com/RisingTechOSS/android_vendor_addons.git fourteen
git cherry-pick dbd659e
cd ../..

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# lunch fumking
lunch afterlife_Mi439_4_19-userdebug
make installclean 
m afterlife




