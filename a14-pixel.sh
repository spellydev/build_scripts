#!/bin/bash

rm -rf .repo/local_manifests/

repo init --depth=1 -u https://github.com/Project-Elixir/manifest -b UNO --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Elixir-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories  
/opt/crave/resynctest.sh
echo "====== resynctest Done ======="

# Export
export BUILD_USERNAME=FARHAN_SENSI
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
 lunch aosp_Mi439_4_19-userdebug
 make installclean
 mka bacon
