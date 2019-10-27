#!/bin/bash

YEAR=2019
if [ ! -z "$1" ]
  then
    YEAR=$1
fi

DIR="build"

function downloadLosungXml()
{
  XML_DIR="$DIR/xml"
  mkdir -p "$XML_DIR"
  ZIP="Losung_${YEAR}_XML.zip"
  if [ ! -f "$XML_DIR/$ZIP" ]; then
      wget -P $XML_DIR "https://www.losungen.de/fileadmin/media-losungen/download/$ZIP"
      unzip "$XML_DIR/$ZIP" -d "$XML_DIR"
  fi
  export XML="$XML_DIR/Losungen Free $YEAR.xml"
}

BOOK_DIR="$DIR/books"
function toEpub()
{
  # get dependencies
  if ! [ -x "$(command -v xsltproc)" ]; then
    sudo apt install -y xsltproc
  fi
  if ! [ -x "$(command -v pandoc)" ]; then
    sudo apt install -y pandoc
  fi


  rm -rf "$BOOK_DIR"
  mkdir "$BOOK_DIR"

  export EPUB="$BOOK_DIR/losungen-$YEAR.epub"
  MD="$BOOK_DIR/losungen-$YEAR.md"
  xsltproc los-md.xslt "$XML" > $MD
  pandoc --epub-chapter-level=4\
   -f markdown -o "$EPUB"\
  copyright.md $MD
  
  echo "CREATED ebook $EPUB"
}

function toMobi()
{
  # check dependencies
  if ! [ -x "$(command -v ebook-convert)" ]; then
    echo "skipping MOBI creation!"
    echo "dep missing: requiring Calibre (ebook-convert) to create MOBI format for Kindle."
    echo "https://calibre-ebook.com/download_linux"
    return -1
  fi
  MOBI="$BOOK_DIR/losungen-$YEAR.mobi"
  ebook-convert "$EPUB" "$MOBI"
  echo "CREATED ebook $MOBI"
}
