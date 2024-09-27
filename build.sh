rm -rf out/target/product/earth/*
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14 --git-lfs --depth 1
#clone dev tree
git clone https://github.com/FrhnDroid/Local-Manifest --depth 1 -b Derp-14 .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Farhan
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=derp_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Ipoh 
source build/envsetup.sh
 
# Build the ROM
lunch derp_earth-user && mka derp
