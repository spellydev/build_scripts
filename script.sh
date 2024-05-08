rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests -b a14-matx .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_Mi439-ap1a-userdebug
make installclean
brunch Mi439_4_19 || brunch lineage_Mi439_4_19-ap1a-userdebug || brunch lineage_Mi439_4_19-userdebug
