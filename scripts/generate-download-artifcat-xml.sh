#!/bin/sh

groupId=$1
artifactId=$2
version=$3
DIR=$4


if [ "$DIR" = ""  ];then
    DIR=.
fi

POM=$DIR/download-artifact.xml
echo "Generate $POM to Download $groupId:$artifactId:$version to $DIR"

cat <<EOF > $POM
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>download</artifactId>
    <version>1.0-SNAPSHOT</version>
    <build>
        <plugins>
            <plugin>
                <groupId>com.googlecode.maven-download-plugin</groupId>
                <artifactId>download-maven-plugin</artifactId>
                <version>1.3.0</version>
                <executions>
                    <execution>
                        <id>copy</id>
                        <phase>validate</phase>
                        <goals>
                            <goal>artifact</goal>
                        </goals>
                        <configuration>
                            <groupId>${groupId}</groupId>
                            <artifactId>${artifactId}</artifactId>
                            <version>${version}</version>
                            <type>jar</type>
                            <overWrite>true</overWrite>
                            <outputDirectory>${DIR}</outputDirectory>
                            <outputFileName>app.jar</outputFileName>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
    <repositories>
        <repository>
            <id>private-snapshots</id>
            <url>http://nexus.ik.am:8081/repository/maven-snapshots/</url>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
        <repository>
            <id>private-releases</id>
            <url>http://nexus.ik.am:8081/repository/maven-releases/</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
    </repositories>
    <pluginRepositories>
        <pluginRepository>
            <id>private-plugin-snapshots</id>
            <url>http://nexus.ik.am:8081/repository/maven-central/</url>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </pluginRepository>
        <pluginRepository>
            <id>private-plugin-releases</id>
            <url>http://nexus.ik.am:8081/repository/maven-central/</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </pluginRepository>
    </pluginRepositories>
</project>
EOF
