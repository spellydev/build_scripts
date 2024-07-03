rm -rf .repo/local_manifests/
#repo init rom
repo init --no-repo-verify -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs -g default,-mips,-darwin,-notdefault
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2 .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
riseup mi439 userdebug 
make installclean
rise b
