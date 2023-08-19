sudo apt update
sudo apt install -y scons libncurses-dev python-dev pps-tools git-core asciidoctor python3-matplotlib build-essential manpages-dev pkg-config python3-distutils
wget http://download-mirror.savannah.gnu.org/releases/gpsd/gpsd-3.25.tar.gz
tar -xzf gpsd-3.25.tar.gz
cd gpsd-3.25
sudo scons
sudo scons install
# https://raspberrypi.stackexchange.com/questions/136196/why-does-gpsd-not-update-a-location-past-its-first-fix
sudo mv /usr/sbin/gpsd  /usr/sbin/gpsd.bak
sudo cp /usr/local/sbin/gpsd  /usr/sbin/gpsd
# end fix for updating gpsd executable
gpsd -V