#!/bin/bash

# This script was tested with v.16.4 so get that by default
version='16.4'

pushd /tmp
wget --no-check-certificate https://github.com/nzbget/nzbget/archive/v${version}.zip
unzip v${version}.zip
cd nzbget-${version}

./configure --prefix=/opt/local --with-libxml2-includes=/opt/local/include/libxml2/ --with-libxml2-libraries=/opt/local/lib/ --disable-curses
make
make install
make install-conf
popd

svcadm enable nzbget
