rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs
#Local manifests
git clone https://github.com/PhantomEnigma/local_manifests -b a14-evo .repo/local_manifests

# keys
rm -rf vendor/lineage-priv
git clone https://github.com/Phantm7/build_keys.git -b lin-keys vendor/lineage-priv
echo "============="
echo "Keys copied"
echo "============="

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_Mi439_4_19-ap1a-userdebug || lunch lineage_Mi439_4_19-userdebug
make installclean
m evolution
