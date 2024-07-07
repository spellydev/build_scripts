#!/bin/bash


rm -rf .repo/local_manifests/



#repo init rom
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 11
echo "=================="
echo "Repo init success"
echo "=================="

#Local manifests
git clone https://github.com/Gtajisan/local_manifests -b A11 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh  
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN-MUH-TASIM
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh 
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_Mi439_4_19-user || lunch lineage_Mi439_4_19-eng 
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon 
