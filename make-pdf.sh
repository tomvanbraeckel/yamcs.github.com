#!/bin/sh
set -e

DOCSURL="http://localhost:4000/docs"

function compose_pdf() {
    BASEURL=$1
    TITLE=$2
    echo "Generating $2 from $1"
    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 10mm \
        --margin-bottom 50mm \
        "$BASEURL/print/titlepage/" \
        --print-media-type \
        --footer-html "$BASEURL/print/titlefooter/" \
        "${TITLE}_cover.pdf"

    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 10mm \
        --margin-bottom 15mm \
        cover "$BASEURL/print/titleinner/" \
        "${TITLE}_precontent.pdf"

    # Image quality is not optimal. Below flags seem to have no effect other than
    # increasing the file size
    # --image-quality 600 \
    # --image-dpi 1800 \

    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 20mm \
        --margin-bottom 20mm \
        --margin-left 20mm \
        --margin-right 20mm \
        toc \
        --disable-smart-shrinking \
        --xsl-style-sheet toc.xsl \
        "$BASEURL/print/content/" \
        --disable-smart-shrinking \
        --disable-internal-links \
        --disable-external-links \
        --footer-html "$BASEURL/print/pagefooter/" \
        --print-media-type \
        --zoom 0.9 \
        "${TITLE}_content.pdf"

    # echo "" | ps2pdf -sPAPERSIZE=a4 - ${TITLE}_blank.pdf

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="assets/${TITLE}.pdf" \
        "${TITLE}_cover.pdf" \
        "${TITLE}_precontent.pdf" \
        "${TITLE}_content.pdf"

    rm "$TITLE"_*.pdf
}

TITLE="Yamcs Studio User Guide"
compose_pdf "$DOCSURL/studio" "$TITLE"
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
    "assets/${TITLE}.pdf"

TITLE="Yamcs Server Manual"
compose_pdf "$DOCSURL/server" "$TITLE"
exiftool \
    -Author="Space Applications Services" \
    -Subject="Manual" \
    -keywords="yamcs" \
    -keywords="server" \
    -keywords="mission" \
    -keywords="control" \
    -keywords="system" \
    -keywords="tm" \
    -keywords="tc" \
    -overwrite_original \
    "assets/${TITLE}.pdf"
