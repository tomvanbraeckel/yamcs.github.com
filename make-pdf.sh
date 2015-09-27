#!/bin/sh 
set -e
wkhtmltopdf \
    --title "Yamcs Studio User Guide" \
    http://localhost:4000/docs/studio/print/ \
    --disable-internal-links \
    --disable-external-links \
    --default-header \
    --print-media-type \
    --footer-right blaa \
    "Yamcs Studio User Guide.pdf"

exiftool \
    -Author="Space Applications Services" \
    -Subject="User Guide" \
    -sep "," -keywords="yamcs,studio,mission,control,system,tm,tc" \
    -overwrite_original \
    "Yamcs Studio User Guide.pdf"
