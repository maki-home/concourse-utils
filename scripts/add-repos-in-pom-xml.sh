#!/bin/sh
DIR=$1
if [ "$DIR" = ""  ];then
    DIR=.
fi

POM=$DIR/pom.xml

echo "Add repos in $POM"

sed -i -e "s@<repositories>@<repositories><repository><id>private-snapshots</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></repository><repository><id>private-releases</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></repository>@" $POM
sed -i -e "s@<pluginRepositories>@<pluginRepositories><pluginRepository><id>private-snapshots</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></pluginRepository><pluginRepository><id>private-releases</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></pluginRepository>@" $POM
