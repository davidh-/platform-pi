#!/bin/sh

# sh /home/pi/Desktop/platform-pi/platform-android-setup.sh &

# sleep 10
ubxtool -p RESET
# sleep 1
#update gps to 5Hz 
gpsctl -c 0.5
# sleep 1s

# sleep 1
# sudo systemctl stop gpsd
# echo -e "\xB5\x62\x06\x08\x06\x00\x64\x00\x01\x00\x01\x00\x7A\x12" > /dev/ttyACM0
# sudo systemctl start gpsd

python3 /home/pi/python-libgqe/graph.py &

# qspectrumanalyzer &
python3 /home/pi/ht301_hacklib/opencv_new.py &
# navit &
python3 /home/pi/uv-cam/uv-cam.py &
# cd /home/pi/SCServo_Python/sms_sts/
# sudo python3 dir_control.py 

cd ~/SCServo_Python/sms_sts/ && lxterminal -e python3 dir_control.py &