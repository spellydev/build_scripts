rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-evo .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_mi439-ap1a-userdebug || lunch lineage_mi439-userdebug
make installclean
m evolution
