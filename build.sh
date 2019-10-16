#!/bin/bash

YEAR=2019
if [ ! -z "$1" ]
  then
    YEAR=$1
fi

# dl source
ZIP="Losung_${YEAR}_XML.zip"
if [ ! -f "$ZIP" ]; then
    wget https://www.losungen.de/fileadmin/media-losungen/download/$ZIP
    unzip $ZIP
fi

# get dependencies
if ! [ -x "$(command -v xsltproc)" ]; then
  sudo apt install -y xsltproc
fi
if ! [ -x "$(command -v pandoc)" ]; then
  sudo apt install -y pandoc
fi


XML="Losungen Free $YEAR.xml"
DIR="out"

rm -rf "$DIR"
mkdir "$DIR"

EPUB="$DIR/losungen-$YEAR.epub"
xsltproc los-md.xslt "$XML" | pandoc -f markdown -o "$EPUB"

echo "CREATED ebook $EPUB"
ebook-viewer "$EPUB"
