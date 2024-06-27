rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs
#Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b udc-2 .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch evolution_mi439-ap1a-userdebug || lunch evolution_mi439-userdebug
make installclean
m evolution
