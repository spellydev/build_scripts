rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests .repo/local_manifests
#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_Mi439_4_19-ap1a-userdebug
make installclean
#KSU
cd kernel/xiaomi/mithorium-4.19/kernel
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
croot
brunch lineage_Mi439_4_19-ap1a-userdebug || brunch Mi439_4_19

