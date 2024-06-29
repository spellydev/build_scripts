#ProjectSakura building scrpit for crave

rm -rf .repo/local_manifests/

#Repo init rom
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs

#Local manifests
git clone https://github.com/Gtajisan/local_manifests -b udc-2-derp .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_mi439-ap1a-userdebug
mka baco
