#! /bin/bash

##############################################################################
# Set some global variables
_APK_SERVER="FIXME"

##############################################################################
# Changing Directory for ease of paths
cd ~/

# Installing ADB on linux machine for use in script
sudo apt-get install android-tools-adb:i386 -y

# Start the adb server
sudo adb start-server

# Pause the script for 10 seconds to restart adb server, and to accept key authentication on device
	echo "Restarting the adb server this will take 10 seconds, please accept the key authentication on device"
sleep 10

##############################################################################
		wget "$_APK_SERVER"/apk/Socrative_20Student_4.3.0_apk-dl.com.apk
                wget "$_APK_SERVER"/apk/MobiLock_20Kiosk_20Lockdown_2.1.1_apk-dl.com.apk
 		wget "$_APK_SERVER"/apk/WiFi Manager_3.5.4.2_apk-dl.com.apk
		wget "$_APK_SERVER"/apk/20150925_tabletbg-mgbg.png
                
# Script for downloading designated apk files and images for installation on 
# multiple devices to be deployed
for device in `adb devices | grep -v "List" | sed -e "s/\t.*$//"`;
do
		
	echo "Installing app to $device";
		adb -s $device install ~/Socrative_20Student_4.3.0_apk-dl.com.apk;
    
		adb -s $device install ~/MobiLock_20Kiosk_20Lockdown_2.1.1_apk-dl.com.apk;
     
	echo "pushing background PNG to $device's Gallery";
		adb -s $device push ~/20150925_tabletbg-mgbg.png /mnt/sdcard/Download/;
     
done

##############################################################################
# Removing temporary files from machine to prepare for next device.

	echo "Removing temporary files from machine"
		rm -r ~/*.apk
		rm -r ~/20150925_tabletbg-mgbg.png
	echo "All finished, please remove device"
