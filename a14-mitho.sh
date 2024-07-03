rm -rf .repo/local_manifests/
#repo init rom
repo init --no-repo-verify -u https://github.com/RisingTechOSS/android -b thirteen --git-lfs -g default,-mips,-darwin,-notdefault
#Local manifests
git clone https://github.com/MisterZtr/treble_manifest.git .repo/local_manifests  -b 13

#build
/opt/crave/resync.sh
. build/envsetup.sh
riseup mi439 userdebug 
make installclean
rise b
