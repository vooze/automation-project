#! /bin/bash
CT=$(date -u +%H)
URL="http://tgftp.nws.noaa.gov/data/observations/metar/cycles/"$CT"Z.TXT"
# They will get overwritten every 24 hours

if  [ -d "home/vooze/lol/what" ]; then
wget -O "/home/vooze/lol/what/"$CT"Z.TXT" $URL
echo "Mappen 'what' findes allerede"
else
mkdir "/home/vooze/lol/what"
wget -O "/home/vooze/lol/what/"$CT"Z.TXT" $URL
echo "folder 'what' did not exist, so it was created."
fi
