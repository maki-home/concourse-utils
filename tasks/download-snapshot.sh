#!/bin/bash

if [ "x${REPO_URL}" = "x" ];then
    REPO_URL=https://nexus.ik.am:8443/repository/maven-snapshots
fi

if [ "x${VERSION}" = "x" ];then
    VERSION=`cat repo-version/number`-SNAPSHOT
fi

if [ "x${PACKAGING}" = "x" ];then
    PACKAGING=jar
fi

URL=${REPO_URL}/`echo ${GROUP_ID} | sed "s/\./\//g"`/${ARTIFACT_ID}/${VERSION}

SNAPSHOT=`curl -s ${URL}/maven-metadata.xml | grep '<snapshotVersions>' -A 3 | grep 'value' | tr -d ' ' | tr -d '</value>'`

echo "Download ${URL}/${ARTIFACT_ID}-${SNAPSHOT}.${PACKAGING}"
curl -L -J -O ${URL}/${ARTIFACT_ID}-${SNAPSHOT}.${PACKAGING}

mv *.jar output/app.${PACKAGING}