#!/bin/sh 
set -e

BASEURL="http://localhost:4000/docs/studio"
TITLE="Yamcs Studio User Guide"

wkhtmltopdf \
    --title "$TITLE" \
    --margin-top 10mm \
    --margin-bottom 50mm \
    "$BASEURL/print_title.html" \
    --print-media-type \
    --footer-html "$BASEURL/print_title_footer.html" \
    "${TITLE}_cover.pdf"

wkhtmltopdf \
    --title "$TITLE" \
    --margin-top 10mm \
    --margin-bottom 15mm \
    cover "$BASEURL/print_title_inner.html" \
    "${TITLE}_precontent.pdf"

wkhtmltopdf \
    --title "$TITLE" \
    --margin-top 10mm \
    --margin-bottom 15mm \
    toc \
    --disable-smart-shrinking \
    --xsl-style-sheet toc.xsl \
    "$BASEURL/print/" \
    --disable-internal-links \
    --disable-external-links \
    --footer-html "$BASEURL/print_footer.html" \
    --print-media-type \
    --zoom 0.9 \
    "${TITLE}_content.pdf"

#echo "" | ps2pdf -sPAPERSIZE=a4 - ${TITLE}_blank.pdf

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="${TITLE}.pdf" \
    "${TITLE}_cover.pdf" \
    "${TITLE}_precontent.pdf" \
    "${TITLE}_content.pdf"

rm "$TITLE"_*.pdf

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
    "${TITLE}.pdf"
