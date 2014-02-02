pacman -S base-devel miniupnpc boost-libs
git clone https://github.com/bitcoin/bitcoin.git
pushd bitcoin/src
git checkout v0.8.6
make -f makefile.unix
popd
git clone https://github.com/litecoin-project/litecoin.git
pushd litecoin/src
git checkout v0.8.6.2
make -f makefile.unix
popd

cp bitcoin/src/bitcoind /usr/bin/bitcoind
cp litecoin/src/litecoind /usr/bin/litecoind
cp bitcoind.service /etc/systemd/system/btcoind.service
cp litecoind.service /etc/systemd/system/litecoind.service
systemctl enable bitcoind
systemctl start bitcoind
systemctl enable litecoind
systemctl start liteocind
