sudo apt-get update
sudo apt-get install git-core

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

