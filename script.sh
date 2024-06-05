rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14

# Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-derp .repo/local_manifests

# build
/opt/crave/resync.sh

# keys
git clone https://github.com/PhantomEnigma/build_keys.git -b keys build_keys
cp build_keys/* vendor/derp/signing/keys

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave

# Set up build environment
source build/envsetup.sh

# Setup Git LFS
# repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Lunch
lunch derp_mi439-ap1a-userdebug || lunch derp_mi439-userdebug

# Make cleaninstall
make installclean

# Build rom
mka derp
