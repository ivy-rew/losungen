#!/bin/bash

source losungConv.sh 2022

downloadLosungXml
toEpub
toMobi

if [ -x "$(command -v ebook-viewer)" ]; then
  # desktop+calibre only
  ebook-viewer "$EPUB"
fi
