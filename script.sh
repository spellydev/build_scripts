rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/PixelExperience/manifest -b thirteen --git-lfs
#Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b thirteen .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch aosp_mi439-ap1a-userdebug || lunch aosp_mi439-userdebug
make installclean
mka bacon
