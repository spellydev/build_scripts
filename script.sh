rm -rf .repo/local_manifests/

#repo init rom
repo init --depth=1 -u https://github.com/PixelOS-Pixelish/manifest -b eleven

#Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b Udc-2-pixelOS .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch aosp_mi439-userdebug || lunch aosp_mi439-ap1a-userdebug
mka bacon -jX
mka bacon
