rm -rf .repo/local_manifests/
repo init -u https://github.com/Evolution-X/manifest -b u
git clone https://github.com/PhantomEnigma/local_manifests -b a14 .repo/local_manifests
/opt/crave/resync.sh
. build/envsetup.sh
lunch evolution_Mi439_4_19-ap1a-userdebug
make installclean
m evolution
