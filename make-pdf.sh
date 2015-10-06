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
        "$BASEURL/pdf/titlepage/" \
        --print-media-type \
        --exclude-from-outline \
        --footer-html "$BASEURL/pdf/titlefooter/" \
        "/tmp/${TITLE}_cover.pdf"

    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 10mm \
        --margin-bottom 15mm \
        cover "$BASEURL/pdf/titleinner/" \
        --exclude-from-outline \
        "/tmp/${TITLE}_precontent.pdf"

    # Image quality is not optimal. Below image-flags seem to have little effect other than
    # increasing the file size :-(
    # There's a few more things to try. wkhtmltopdf renders to a 800x600 viewport, we could
    # try increasing that, in hopes to get around some bad internal image resizing function.
    # (most of our images are automatically css-resized to 100% of the available width)
    #--disable-internal-links \
    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --page-size A4 \
        --margin-top 20mm \
        --margin-bottom 20mm \
        --margin-left 20mm \
        --margin-right 20mm \
        --image-quality 2000 \
        --image-dpi 18000 \
        toc \
        --exclude-from-outline \
        --disable-smart-shrinking \
        --xsl-style-sheet toc.xsl \
        "$BASEURL/pdf/content/" \
        --disable-smart-shrinking \
        --disable-external-links \
        --footer-html "$BASEURL/pdf/pagefooter/" \
        --print-media-type \
        "/tmp/${TITLE}_content.pdf"

    # echo "" | ps2pdf -sPAPERSIZE=a4 - ${TITLE}_blank.pdf

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="assets/${TITLE}.pdf" \
        "/tmp/${TITLE}_cover.pdf" \
        "/tmp/${TITLE}_precontent.pdf" \
        "/tmp/${TITLE}_content.pdf"

    rm "/tmp/$TITLE"_*.pdf
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

TITLE="Yamcs Client Tools Guide"
compose_pdf "$DOCSURL/tools" "$TITLE"
exiftool \
    -Author="Space Applications Services" \
    -Subject="User Guide" \
    -keywords="yamcs" \
    -keywords="client" \
    -keywords="tools" \
    -keywords="mission" \
    -keywords="control" \
    -keywords="system" \
    -keywords="tm" \
    -keywords="tc" \
    -overwrite_original \
    "assets/${TITLE}.pdf"
