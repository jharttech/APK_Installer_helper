#! /bin/bash

##############################################################################
# Set some global variables
_APK_SERVER="FIXME"
_VERSION="20150929-1"
##############################################################################
# Display running script Version Number
echo "Running mg_apk_script "$_VERSION""

# Changing Directory for verification of paths
cd ~/

# Create working Directory for the script assets
mkdir APK_assets
cd /APK_assets

# Installing ADB on linux machine for use in script
sudo apt-get install android-tools-adb:i386 -y

# Start the adb server
sudo adb start-server

# Pause the script for 10 seconds to restart adb server, and to accept key authentication on device
	echo "Restarting the adb server this will take 10 seconds, please accept the key authentication on device"
sleep 10

##############################################################################
		wget "$_APK_SERVER" # path to downloaded and server or locally stored .apk files
		wget "$_APK_SERVER" # path to downloaded and server or locally stored .png background image if desired

# Script for downloading designated apk files and images for installation on
# multiple devices to be deployed
for device in `adb devices | grep -v "List" | sed -e "s/\t.*$//"`;
do

	echo "Installing app to $device";
		adb -s $device install /home/"FIXME"/APK_assets/"FIXME"; # Specify the path and the .apk file name

	echo "pushing background PNG to $device's Download folder";
		adb -s $device push /home/"FIXME"/APK_assets/"FIXME" /mnt/sdcard/Download/; # Specify the path and .png file name if background image is wanted

done

##############################################################################
# Removing temporary files from machine to prepare for next device.

	echo "Removing temporary files from machine"
		rm -r /home/"user"/APK_assets/*.apk
		rm -r /home/"user"/APK_assets/*.png
	cd ~/
	rm -r APK_assets
	echo "All finished, please remove device"
