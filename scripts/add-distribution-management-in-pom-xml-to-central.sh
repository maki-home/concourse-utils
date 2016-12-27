#!/bin/bash
set -e

DIR=$1
if [ "$DIR" = ""  ];then
    DIR=.
fi

POM=$DIR/pom.xml

echo "Add distribution-management in $POM"

sed -i -e "s@</project>@<distributionManagement><snapshotRepository><id>ossrh</id><url>https://oss.sonatype.org/content/repositories/snapshots</url></snapshotRepository><repository><id>ossrh</id><url>https://oss.sonatype.org/service/local/staging/deploy/maven2/</url></repository></distributionManagement></project>@" $POM