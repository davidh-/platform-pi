#!/bin/sh
#to-do: add copy from system to system-files option for backup purposes



cp -a system-files/alacarte-made.desktop /home/pi/.config/autostart
cp -a system-files/dhcpcd.conf /etc
cp -a system-files/dnsmasq.conf  /etc
cp -a system-files/routed-ap.conf /etc/sysctl.d
cp -a system-files/wpa_supplicant.conf /etc/wpa_supplicant
cp -a system-files/hostapd.conf /etc/hostapd
cp -a system-files/.bashrc /home/pi
cp -a system-files/chrony.conf /etc/chrony
cp -a system-files/gpsd /etc/default
cp -a system-files/99-usb-serial.rules /etc/udev/rules.d
