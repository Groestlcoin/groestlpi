#!/bin/bash
echo "Groestlcoin Installer RPI"
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
  echo "Running as Root"
fi

#Getting Deps
echo "Installing Dependancies"
apt-get install -y build-essential autoconf libssl-dev libboost-all-dev libdb5.3 libdb5.3-dev libdb5.3++-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev libtool automake libevent-dev bsdmainutils git ntp make g++ gcc cpp ngrep iftop sysstat autotools-dev pkg-config libminiupnpc-dev libzmq3-dev

git clone https://github.com/Groestlcoin/groestlcoin.git
cd groestlcoin || echo "Failed!"; exit
sh autogen.sh
./configure
make
make install

cp groestlcoin/src/groestlcoind /usr/bin/groestlcoind
cp groestlcoind.service /etc/systemd/system/groestlcoind.service
systemctl enable groestlcoind
systemctl start groestlcoind
