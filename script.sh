#!/bin/bash
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
git config --global user.email salitagwapo@gmail.com
git config --global user.name Jayzee
rm -rf .repo/local_manifests/


# repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14 --git-lfs
echo "=============================="
echo "gay DerpFest Repo init success"
echo "=============================="

# Local manifests
git clone https://github.com/FrhnDroid/Local-Manifest -b Voltage-14 .repo/local_manifests
echo "========================================="
echo "Fuckin# shit Local manifest clone success"
echo "========================================="

# build
/opt/crave/resync.sh
echo "======================"
echo "Sync successfully Done"
echo "======================"

# Export
export BUILD_USERNAME=Jayzee-Zee
export BUILD_HOSTNAME=crave
echo "============="

# Set up build environment
source build/envsetup.sh
echo "======================================"
echo "im crave sir you rom sync Done ok bye "
echo "======================================"

# Lunch
breakfast derp_earth-userdebug 
echo "============="

# Make cleaninstall
#make installclean
echo "============="

# Build rom
mka derp
