#!/bin/bash
set -e

DIR=$1
if [ "$DIR" = ""  ];then
    DIR=.
fi

POM=$DIR/pom.xml

echo "Add distribution-management in $POM"

sed -i -e "s@</project>@<distributionManagement><snapshotRepository><id>ossrh</id><url>https://oss.sonatype.org/content/repositories/snapshots</url></snapshotRepository><repository><id>ossrh</id><url>https://oss.sonatype.org/service/local/staging/deploy/maven2/</url></repository></distributionManagement></project>@" $POM

echo "Add profiles for nexus-staging-maven-plugin in $POM"

sed -i -e 's@</project>@<profiles><profile><id>ossrh</id><properties><gpg.executable>gpg</gpg.executable><gpg.keyname>${env.GPG_KEYNAME}</gpg.keyname><gpg.passphrase>${env.GPG_PASSPHRASE}</gpg.passphrase><gpg.defaultKeyring>false</gpg.defaultKeyring><gpg.publicKeyring>${env.GPG_DIR}/pubring.gpg</gpg.publicKeyring><gpg.secretKeyring>${env.GPG_DIR}/secring.gpg</gpg.secretKeyring></properties><activation><property><name>performRelease</name><value>true</value></property></activation><build><plugins><plugin><groupId>org.apache.maven.plugins</groupId><artifactId>maven-gpg-plugin</artifactId><version>1.5</version><executions><execution><id>sign-artifacts</id><phase>verify</phase><goals><goal>sign</goal></goals></execution></executions></plugin><plugin><groupId>org.sonatype.plugins</groupId><artifactId>nexus-staging-maven-plugin</artifactId><version>1.6.2</version><extensions>true</extensions><configuration><serverId>ossrh</serverId><nexusUrl>https://oss.sonatype.org/</nexusUrl><autoReleaseAfterClose>true</autoReleaseAfterClose></configuration></plugin></plugins></build></profile></profiles></project>@' $POM