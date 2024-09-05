rm -rf out/target/product/earth/*
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs
#clone dev tree
git clone https://github.com/FrhnDroid/Local-Manifest --depth 1 -b EvolutionXyz .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Farhan
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_earth
#export TARGET_RELEASE=ap2a
export TZ=Asia/Ipoh
source build/envsetup.sh
 
# Build the ROM
lunch lineage_earth-userdebug && m evolution
