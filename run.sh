#!/bin/sh

sh /home/pi/Desktop/platform-pi/platform-android-setup.sh &


#update gps to 10Hz 
# gpsctl -c 0.1
# sudo systemctl stop gpsd
# echo -e "\xB5\x62\x06\x08\x06\x00\x64\x00\x01\x00\x01\x00\x7A\x12" > /dev/ttyACM0
# sudo systemctl start gpsd

python3 /home/pi/python-libgqe/graph.py &

# qspectrumanalyzer &
# python3 /home/pi/ht301_hacklib/opencv.py &
# navit &

