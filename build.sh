#!/bin/bash

source losungConv.sh

downloadLosungXml
toEpub
toMobi
ebook-viewer "$EPUB"
