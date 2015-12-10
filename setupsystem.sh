sudo apt-get update
sudo apt-get upgrade
sudo apt-get clean
sudo apt-get install nginx

cd $HOME
mkdir bin
cd bin
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..

git clone https://github.com/technion/lol_dht22
cd lol_dht22
./configure
make

sudo ./loldht 7

cd ~
git clone https://github.com/mronnlun/Raspberry-thermometer

cd Raspberry-thermometer/
chmod 755 duckdns.sh
chmod 755 logtemperature.sh

cd /var/www/html/
sudo rm index.nginx-debian.html
cd ~/Raspberry-thermometer
sudo cp index.html /var/www/html/
