#!/bin/bash

source losungConv.sh 2021

downloadLosungXml
toEpub
toMobi
ebook-viewer "$EPUB"
