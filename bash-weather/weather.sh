#! /bin/bash
CT=$(date -u +%H)
URL="http://tgftp.nws.noaa.gov/data/observations/metar/cycles/"$CT"Z.TXT"
# They will get overwritten every 24 hours

if  [ -d "/home/vagrant/weather" ]; then
wget -O "/home/vagrant/weather/"$CT"Z.TXT" $URL
echo "The folder 'weather' already exists"
else
mkdir "/home/vagrant/weather"
wget -O "/home/vagrant/weather/"$CT"Z.TXT" $URL
echo "The folder 'weather' did not exist, so it was created."
fi
