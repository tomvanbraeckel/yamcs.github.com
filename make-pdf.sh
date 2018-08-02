#!/bin/bash
set -e


#  Usage: ./make-pdf.sh [document_name version]
#
#  If no arguments are provided, generate the 4 pdf documents for the latest version.
#  
#  Optional arguments:
#  document_name: one of "server", "studio"
#  version: version number, must match directory name in /docs/<document_name>/<version>
#
#  If the optional arguments are provided, generate the pdf document for the requested document with the requested version.
#  Output name is <title>-<version>.pdf
#
#  PDF documents are stored in Nexus. This part is not automated.

DOC=$1
VERSION=$2

if [ -n "$DOC" ] && [ "$DOC" != "server" ] && [ "$DOC" != "studio" ]; then
echo "Usage: ./make-pdf.sh [document_name] [version], with document_name one of 'server', 'studio'"
exit
fi

if [ -n "$VERSION" ]; then
FILE_SUFFIX="-"$VERSION
fi

DOCSURL="http://localhost:4000/docs"

function compose_pdf() {

    BASEURL=$1
    TITLE=$2

    if [ -n "$VERSION" ]; then
      BASEURL="$BASEURL/$VERSION"
    fi

    echo "Generating $TITLE from $BASEURL"
    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 10mm \
        --margin-bottom 50mm \
        "$BASEURL/pdf/titlepage/?version="$VERSION \
        --print-media-type \
        --exclude-from-outline \
        --footer-html "$BASEURL/pdf/titlefooter/" \
        "/tmp/${TITLE}_cover.pdf"

    wkhtmltopdf \
        --title "$TITLE" \
        --quiet \
        --margin-top 10mm \
        --margin-bottom 15mm \
        cover "$BASEURL/pdf/titleinner/?version="$VERSION \
        --exclude-from-outline \
        "/tmp/${TITLE}_precontent.pdf"

    # Image quality is not optimal. Below image-flags seem to have little effect other than
    # increasing the file size :-(
    #--image-quality 2000 \
    #--image-dpi 18000 \
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
        toc \
        --exclude-from-outline \
        --disable-smart-shrinking \
        --xsl-style-sheet docs/toc.xsl \
        "$BASEURL/pdf/content/" \
        --disable-smart-shrinking \
        --disable-external-links \
        --footer-html "$BASEURL/pdf/pagefooter/" \
        --print-media-type \
        "/tmp/${TITLE}_content.pdf"

    # echo "" | ps2pdf -sPAPERSIZE=a4 - ${TITLE}_blank.pdf

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="/tmp/${TITLE}${FILE_SUFFIX}.pdf.wkhtmltopdf" \
        "/tmp/${TITLE}_cover.pdf" \
        "/tmp/${TITLE}_precontent.pdf" \
        "/tmp/${TITLE}_content.pdf"

    rm -f "/tmp/$TITLE"_*.pdf
}

if [ -z "$DOC" ] || [ "$DOC" = "studio" ]; then
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
    "/tmp/${TITLE}${FILE_SUFFIX}.pdf.wkhtmltopdf"
fi

if [ -z "$DOC" ] || [ "$DOC" = "server" ]; then
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
    "/tmp/${TITLE}${FILE_SUFFIX}.pdf.wkhtmltopdf"
fi

# Move only at the end to prevent restarts of jekyll
for file in /tmp/*.pdf.wkhtmltopdf; do
    FILENAME=$(basename "$file")
    mv "$file" "${FILENAME%.*}"
done
