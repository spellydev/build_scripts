crave run --no-patch -- "rm -rf .repo/local_manifests && \
git clone https://github.com/Gtajisan/local_manifests_clo.git --depth 1 -b Udc-2-pixelOS .repo/local_manifests && \
repo init -u https://github.com/PixelOS-Pixelish/manifest -b eleven; \
/opt/crave/resync.sh && \
source build/envsetup.sh && \
lunch aosp_mi439-userdebug || lunch aosp_mi439-ap1a-userdebug && \
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true; \
export BUILD_USERNAME=Gtajisan; \
export BUILD_HOSTNAME=Gtajisan@crave.io; \
export KBUILD_BUILD_USER=Gtajisan; \
export KBUILD_BUILD_HOST=Gtajisan@crave.io; \
mka bacon -jX"
