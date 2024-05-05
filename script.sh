rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_Mi439-ap1a-userdebug
make installclean
brunch lineage_Mi439-ap1a-userdebug || brunch Mi439

