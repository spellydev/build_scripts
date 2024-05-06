rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/CherishOS/android_manifest.git -b uqpr2
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-cherish .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch cherish_mi439-ap1a-userdebug || lunch cherish_mi439-userdebug || lunch mi439-ap1a-userdebug || lunch mi439-userdebug
make installclean
brunch cherish_mi439-ap1a-userdebug || brunch cherish_mi439-userdebug || brunch mi439-ap1a-userdebug || brunch mi439-userdebug
