#!/bin/sh

username=$1
password=$2

cat <<EOF > settings.xml
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
