rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/BlissRoms/platform_manifest.git -b universe --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests_clo -b udc-2-bliss .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
blissify -c -v mi439 || blissify -c -v bliss_mi439
