rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-derp .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# keys
git clone https://github.com/PhantomEnigma/build_keys.git -b keys build_keys
cp build_keys/* vendor/derp/signing/keys
echo "============="
echo "Keys copied"
echo "============="

# pico gapps
git clone https://github.com/PhantomEnigma/scripts.git -b pico gms_pico
cp gms_pico/gms_pico.mk vendor/gms
echo "====================="
echo "useless gapps removed"
echo "====================="

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave
echo "============="

# Set up build environment
source build/envsetup.sh
echo "============="
# Setup Git LFS
# repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Lunch
lunch derp_mi439-ap1a-userdebug || lunch derp_mi439-userdebug
echo "============="
# Make cleaninstall
make installclean
echo "============="
# Build rom
mka derp
