#!/bin/bash
set -e

username=$1
password=$2

DIR=$3
if [ "$DIR" = ""  ];then
    DIR=.
fi

SETTINGS=$DIR/settings.xml

echo "Generate $SETTINGS"

cat <<EOF > $SETTINGS
<?xml version="1.0" encoding="utf-8"?>
<settings>
  <servers>
    <server>
      <id>private-snapshots</id>
      <username>${username}</username>
      <password>${password}</password>
    </server>
    <server>
      <id>private-releases</id>
      <username>${username}</username>
      <password>${password}</password>
    </server>
  </servers>
</settings>
EOF
