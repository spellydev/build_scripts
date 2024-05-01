rm -rf .repo/local_manifests/
repo init -u https://github.com/Evolution-X/manifest -b u
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2 .repo/local_manifests
/opt/crave/resync.sh
. build/envsetup.sh
lunch evolution_mi439-ap1a-userdebug
make installclean
m evolution
