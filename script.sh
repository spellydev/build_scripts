#ProjectSakura build script
#!/bin/bash

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ || { echo "Failed to remove local_manifests"; exit 1; }

# Initialize ProjectBlaze repo
echo "Initializing ProjectBlaze repo..."
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs || { echo "Repo init failed"; exit 1; }

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/Gtajisam/local_manifests -b Project-Sakura .repo/local_manifests || { echo "Cloning local_manifests failed"; exit 1; }

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh || { echo "Resync failed"; exit 1; }

# Set build details
export BUILD_USERNAME=FARHAN-MUH-TASIM
export BUILD_HOSTNAME=crave

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh || { echo "Envsetup failed"; exit 1; }

# Lunch configuration
echo "Configuring lunch..."
lunch lineage_Mi439_4_19-ap2a-userdebug || { echo "Lunch configuration failed"; exit 1; }

# Build the ProjectBlaze
echo "Building ProjectBlaze..."
make bacon || { echo "Build failed"; exit 1; }

echo "Build completed successfully!"
