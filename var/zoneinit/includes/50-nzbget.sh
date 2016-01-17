cd
mkdir build
cd build
wget --no-check-certificate https://github.com/nzbget/nzbget/archive/v15.0.zip
unzip v15.0.zip
cd nzbget-15.0

./configure --prefix=/opt/local --with-libxml2-includes=/opt/local/include/libxml2/ --with-libxml2-libraries=/opt/local/lib/ --disable-curses
make
make install
make install-conf

curl -sk https://gist.githubusercontent.com/baetheus/71533d6358e55342dbb9/raw/nzbget.xml > $HOME/build/nzbget.xml
svccfg import $HOME/build/nzbget.xml
svcadm enable nzbget
