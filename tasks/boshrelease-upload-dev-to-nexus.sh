#!/bin/bash

export VERSION=`cat repo-version/number`
cd releases
echo `ls *.tgz` > lastest.txt
curl -v -XPUT -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} --upload-file ./*.tgz -k ${NEXUS_URL}/repository/bosh-releases/nexus/${VERSION}/
curl -v -XPUT -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} --upload-file ./lastest.txt -k ${NEXUS_URL}/repository/bosh-releases/nexus/${VERSION}/