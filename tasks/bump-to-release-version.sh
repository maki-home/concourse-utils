#!/bin/bash
set -e

BASEDIR=`pwd`
M2REPO=$BASEDIR/m2/rootfs/opt/m2
echo "M2REPO=$M2REPO"
VERSION=`cat repo-version/number`
MESSAGE="[skip ci] Release $VERSION"

shopt -s dotglob
mv -f repo-prod/* master-out
echo "Bump to $VERSION"
cd master-out
if [ "x${PROJECT}" != "x" ];then
    cd ${PROJECT}
fi
mvn versions:set -DnewVersion=${VERSION} -Dmaven.repo.local=${M2REPO}
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add -A
git commit -m "${MESSAGE}"
