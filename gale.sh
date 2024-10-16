rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/RisingTechOSS/android.git -b fourteen --git-lfs --depth=1
#clone dev tree
git clone https://github.com/spellydev/Local-Manifest --depth 1 -b RisingGALE .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=spellydev
export BUILD_HOSTNAME=crave
#export TARGET_PRODUCT=lineage_gale
#export TARGET_RELEASE=ap2a
export TZ=Asia/Ipoh
export RISING_MAINTAINER=itzSpelly
source build/envsetup.sh
 
# Build the ROM
riseup gale user && rise b
