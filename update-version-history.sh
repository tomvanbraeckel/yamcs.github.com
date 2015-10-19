#!/bin/sh


# Add the new version to tag "previousVersions, only if it is not already there

file=$1
version=$2
if ! grep -q $version, "$file"; then   
  sed -i "s/previousVersions: \[ latest/previousVersions: \[ latest, $version/g" $file
fi
