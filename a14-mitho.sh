rm -rf .repo/local_manifests/
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2 .repo/local_manifests
/opt/crave/resync.sh
. build/envsetup.sh
riseup Mi439_4_19 userdebug 
make installclean
rise b
