#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://github.com/Project-Elixir/manifest -b UNO --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b Project-Elixir .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh || . build/envsetup.sh
echo "============="
echo "Sync success"
echo "============="

# keys
git clone https://github.com/PhantomEnigma/build_keys.git -b blaze-keys vendor/extra
echo "============="
echo "Keys copied"
echo "============="

# Export
export BUILD_USERNAME=Phantom
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch aosp_Mi439_4_19-ap1a-userdebug || lunch aosp_Mi439_4_19-userdebug || lunch aosp_Mi439_4_19-userdebug
echo "============="
# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
