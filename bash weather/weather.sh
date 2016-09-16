#! /bin/bash
CT=$(date -u +%H)
URL="http://tgftp.nws.noaa.gov/data/observations/metar/cycles/"$CT"Z.TXT"
# They will get overwritten every 24 hours

if  [ -d "~/weather" ]; then
wget -O "~/weather/"$CT"Z.TXT" $URL
echo "The folder 'weather' already exists"
else
mkdir "~/weather"
wget -O "~/weather/"$CT"Z.TXT" $URL
echo "The folder 'weather' did not exist, so it was created."
fi
