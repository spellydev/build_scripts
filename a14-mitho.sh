rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests -b a14 .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
riseup Mi439_4_19 userdebug 
make installclean
rise b
