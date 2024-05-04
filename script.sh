rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2 .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
brunch mi439 || brunch lineage_mi439-ap1a-userdebug
