#!/bin/sh 
set -e
wkhtmltopdf \
    --title "Yamcs Studio User Guide" \
    --margin-top 10mm \
    --margin-bottom 50mm \
    http://localhost:4000/docs/studio/print_title.html \
    --print-media-type \
    --footer-html http://localhost:4000/docs/studio/print_title_footer.html \
    "Yamcs Studio User Guide_1_cover.pdf"

wkhtmltopdf \
    --title "Yamcs Studio User Guide" \
    --margin-top 10mm \
    --margin-bottom 10mm \
    cover http://localhost:4000/docs/studio/print_title_inner.html \
    http://localhost:4000/docs/studio/print/ \
    --disable-internal-links \
    --disable-external-links \
    --default-header \
    --header-left "Yamcs Studio User Guide" \
    --header-spacing 5 \
    --header-font-name "Helvetica" \
    --header-font-size 10 \
    --print-media-type \
    --zoom 0.8 \
    "Yamcs Studio User Guide_2_content.pdf"

#echo "" | ps2pdf -sPAPERSIZE=a4 - Yamcs\ Studio\ User\ Guide_blank.pdf

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="Yamcs Studio User Guide.pdf" \
    "Yamcs Studio User Guide_1_cover.pdf" \
    "Yamcs Studio User Guide_2_content.pdf"

rm -f Yamcs\ Studio\ User\ Guide_*.pdf

exiftool \
    -Author="Space Applications Services" \
    -Subject="User Guide" \
    -keywords="yamcs" \
    -keywords="studio" \
    -keywords="mission" \
    -keywords="control" \
    -keywords="system" \
    -keywords="tm" \
    -keywords="tc" \
    -overwrite_original \
    "Yamcs Studio User Guide.pdf"
