#!/bin/sh

sed -i -e "s@<repositories>@<repositories><repository><id>private-snapshots</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></repository><repository><id>private-releases</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></repository>@" pom.xml
sed -i -e "s@<pluginRepositories>@<pluginRepositories><pluginRepository><id>private-snapshots</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></pluginRepository><pluginRepository><id>private-releases</id><url>http://nexus.ik.am:8081/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></pluginRepository>@" pom.xml
