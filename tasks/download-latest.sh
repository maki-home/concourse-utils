#!/bin/bash
set -e

if [ "x${REPO_URL}" = "x" ];then
    REPO_URL=https://nexus-192-168-11-210.sslip.io/repository/maven-releases
fi

if [ "x${PACKAGING}" = "x" ];then
    PACKAGING=jar
fi

URL=${REPO_URL}/`echo ${GROUP_ID} | sed "s/\./\//g"`/${ARTIFACT_ID}

VERSION=`curl -s ${URL}/maven-metadata.xml | grep '<release>' | tr -d ' '| tr -d '</release>'`

echo "Download ${URL}/${VERSION}/${ARTIFACT_ID}-${VERSION}.${PACKAGING}"
curl -L -J -O ${URL}/${VERSION}/${ARTIFACT_ID}-${VERSION}.${PACKAGING}

mv *.${PACKAGING} output/app.${PACKAGING}