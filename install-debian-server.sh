#!/usr/bin/env sh

set -e

BASE_DIR="$(dirname "$0")"

echo "Which version of Xonotic do you want to install?:"
read VERSION

apt-get update
apt-get install -y unzip systemd curl python3 python3-pip make

curl -Lo /tmp/xonotic.zip "http://dl.xonotic.org/xonotic-$VERSION.zip"
unzip /tmp/xonotic.zip -d /tmp
pushd /tmp/Xonotic
make install
popd

adduser --disabled-password --gecos "" xonotic
echo 'export PATH="$PATH:$HOME/.local/bin"' > /home/xonotic/.bashrc

su xonotic -c 'mkdir -p /home/xonotic/.xonotic/data'
su xonotic -c "cp $BASE_DIR/server.cfg /home/xonotic/.xonotic/data/server.cfg"
su xonotic -c 'pip3 install xmm --user'

cp "$BASE_DIR/xonotic.service" /lib/systemd/system/xonotic.service
cp "$BASE_DIR/xonotic-maps.service" /lib/systemd/system/xonotic-maps.service

systemctl daemon-reload
systemctl enable xonotic
systemctl enable xonotic-maps
