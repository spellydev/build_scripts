rm -rf .repo/local_manifests/
echo "repo init rom"
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
#Local manifests
git clone https://github.com/Jayzee-Zee/local_manifests/tree/Rising .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
export TARGET_PRODUCT=earth
riseup earth userdebug 
#make installclean
#cd kernel/xiaomi/mithorium-4.19/kernel
#curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
croot
rise b
