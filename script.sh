rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-derp .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch derp_Mi439_4_19-ap1a-userdebug || lunch derp_Mi439_4_19-userdebug
make installclean
mka derp
