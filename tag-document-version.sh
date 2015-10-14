#!/bin/bash

# 1) Copy guide from /_data/sidebar/guides/<document>.yaml to /_data/sidebar/guides/<document>_<version_escaped>.yaml
# 2) copy files from /docs/<document>/* to /docs/history/<document>/<version>/
# Next steps are from folder /docs/history/<document>/<version>/
# 3) Edit index.html to:
#    - in header, modify pdf link to /assets/<doc_title>-<version>.pdf
#    - in header, remove tag "previousVersions"
#    - in body, append <version_escaped> to {% include toc.html structure=site.data.sidebar.guides.[...]
# 4) Edit all files header to:
#    - insert version in permalink
#    - add version tag
# 5) Edit pdf/*.md to:
#    - insert version in permalink
# 6) Edit pdf/content.md file header to:
#    - append _<version_escaped> to tag guide
# 7) Update /doc/<document>/index.html to:
#    - check if tag "previousVersions" exists in header, else add it
#    - add <version> to tag "previousVersions"
# 8) Wait for jekkyl to update website (arbitrary 20 s), then generate PDF of <document> <version>



document=$1
version=$2
version_escaped=${version//[.]/_}

if [ -z "$document" ] || [ -z "$version" ]; then
echo "usage: ./tag-document-version.sh <document> <version>, with <document> one of [server, studio, tools, api]."
exit
fi

echo updating website, document: $document , version: $version
#1)
cp _data/sidebar/guides/$document.yaml _data/sidebar/guides/${document}_$version_escaped.yaml
sed -i "s/docs\/$document/docs\/$document\/$version/g" _data/sidebar/guides/${document}_$version_escaped.yaml

#2)
mkdir -p docs/history/$document/$version/
cp -r docs/$document/* docs/history/$document/$version/

#3)
sed -i "s/.pdf/-$version.pdf/g" docs/history/$document/$version/index.html
sed -i '/previousVersions/d' docs/history/$document/$version/index.html
sed -i "s/structure=site.data.sidebar.guides.$document/structure=site.data.sidebar.guides.${document}_$version_escaped/g" docs/history/$document/$version/index.html

#4)
sed -i "s/permalink:/version: $version\npermalink:/g" docs/history/$document/$version/*.*
sed -i "s/permalink: \/docs\/$document/permalink: \/docs\/$document\/$version/g" docs/history/$document/$version/*.*

#5)
sed -i "s/permalink: \/docs\/$document/permalink: \/docs\/$document\/$version/g" docs/history/$document/$version/pdf/*

#6)
sed -i "s/guide: $document/guide: ${document}_$version_escaped/g" docs/history/$document/$version/pdf/content.md

#7)
if ! grep -q previousVersions "docs/$document/index.html"; then   
   # add tag previousVersion to index if necessary
   echo adding previousVersion tag in \"docs/$document/index.html\"
   sed -i "s/title:/previousVersions: [ $version ]\ntitle:/g" docs/$document/index.html
else
   # if it exists, add the new version only if it is not already there
   if ! grep -q $version "docs/$document/index.html"; then   
     sed -i "s/previousVersions: \[/previousVersions: \[ $version\,/g" docs/$document/index.html
   fi
fi

#8)
read -n1 -r -p "Waiting for jekyll to update the website, press any key to start PDF file generation..." key
./make-pdf.sh $document $version


