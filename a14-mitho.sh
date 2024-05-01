rm -rf .repo/local_manifests/  && \
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs && \
git clone https://github.com/PhantomEnigma/local_manifests -b a14 .repo/local_manifests && \
/opt/crave/resync.sh  && \
. build/envsetup.sh && \
lunch lineage_Mi439_4_19-ap1a-userdebug && \
make installclean && \
mka bacon
