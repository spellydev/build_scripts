#!/bin/bash
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
git config --global user.email salitagwapo@gmail.com
git config --global user.name Jayzee-Zee

rm -rf .repo/local_manifests/

# repo init rom
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b QPR3 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Jayzee-Zee/Local-Manifest -b Voltage-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# cherry-pick
cd build/make 
git fetch https://github.com/LineageOS/android_build refs/changes/82/390682/2 
git cherry-pick FETCH_HEAD
cd ../..
echo "======= cherry-pick Done ======"

# remove face unlock 
rm -rf packages/apps/FaceUnlock

# Export
export BUILD_USERNAME=Jayzee-Zee
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch infinity_earth-userdebug 
#make installclean
mka bacon
