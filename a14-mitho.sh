rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
#Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b lineage-21 .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lineage Mi439 userdebug || lunch lineage_Mi439-userdebug || lunch lineage_Mi439-ap1a-userdebug || lunch lineage_mi439-userdebug || lunch lineage_mi439-ap1a-userdebug
make installclean
mka bacon
