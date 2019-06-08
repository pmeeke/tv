#/bin/bash

#Usage

#you dont even need to copy the script to your drive. for example
# bash <(curl -s https://gist.githubusercontent.com/pmeeke/ca144c67872bd1d113e27e5419104c90/raw/bfa546da2f4cf212744f35d888f8dea64301c2c7/m3ugrab.sh)

read -p "Enter m3u url: "  URL
read -p "Enter filename: "  FILENAME
touch "$HOME/$FILENAME"
rm "$HOME/$FILENAME"
wget -r -O  "$HOME/$FILENAME"  "$URL"
dos2unix "$HOME/$FILENAME"
perl -pi -e 's/^http\:\/\//pipe\:\/\/\/usr\/bin\/ffmpeg\ \-loglevel\ fatal\ \-re\ -\i\ http\:\/\//g' "$HOME/$FILENAME"
dos2unix "$HOME/$FILENAME"
sed -i 's/pipe.*/& \-c\ copy\ \-f\ mpegts\ \-tune\ zerolatency\ pipe\:1/g' "$HOME/$FILENAME"
dos2unix "$HOME/$FILENAME"
m3ugrab.sh (END)
