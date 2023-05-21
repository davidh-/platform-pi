#!/bin/sh

# pre-req 'sudo apt-get install -y android-tools-adb'

# Check if any devices are connected
deviceCount=$(adb devices | wc -l)

if [ "$deviceCount" -lt 3 ]; then
  echo "No devices found. Exiting..."
  exit 1
fi

# Check USB tethering
usbTethering=$(adb shell dumpsys tethering | grep "ncm0 - TetheredState")
# Check Wi-Fi hotspot tethering
wifiTethering=$(adb shell dumpsys tethering | grep "ap_br_wlan2 - TetheredState")

if [ -z "$usbTethering" ] || [ -z "$wifiTethering" ]; then
  # Either USB tethering or Wi-Fi hotspot tethering is not on, run the necessary commands
  echo "Enabling tethering..."

  adb shell input keyevent 82
  adb shell input keyevent 82
  adb shell input text 0214
  adb shell input keyevent 66
  sleep 5
  if [ -z "$wifiTethering" ]; then
    # Wi-Fi hotspot tethering is not on, run the commands to enable it
    echo "Enabling Wi-Fi hotspot tethering..."

    adb shell am start -S com.android.settings/.TetherSettings
    adb shell input keyevent 66
    adb shell input keyevent 66
  fi
  adb shell input keyevent 26
else
  echo "Both USB tethering and Wi-Fi hotspot tethering are already active."
fi
