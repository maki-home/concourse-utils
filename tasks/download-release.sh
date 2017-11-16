#!/bin/bash
set -e

if [ "x${REPO_URL}" = "x" ];then
    REPO_URL=https://nexus.ik.am/repository/maven-releases
fi

if [ "x${VERSION}" = "x" ];then
    VERSION=`cat repo-version/number`
fi

if [ "x${PACKAGING}" = "x" ];then
    PACKAGING=jar
fi

URL=${REPO_URL}/`echo ${GROUP_ID} | sed "s/\./\//g"`/${ARTIFACT_ID}/${VERSION}
echo "Download ${URL}/${ARTIFACT_ID}-${VERSION}.${PACKAGING}"
curl -L -J -O ${URL}/${ARTIFACT_ID}-${VERSION}.${PACKAGING}

mv *.${PACKAGING} output/app.${PACKAGING}
