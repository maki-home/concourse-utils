#!/bin/sh

sed -i -e "s@</project>@<distributionManagement><repository><id>private-releases</id><url>http://nexus.ik.am:8081/repository/maven-releases/</url></repository><snapshotRepository><id>private-snapshots</id><url>http://nexus.ik.am:8081/repository/maven-snapshots/</url></snapshotRepository></distributionManagement></project>@" pom.xml
