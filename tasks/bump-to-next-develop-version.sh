#!/bin/bash
set -e

BASEDIR=`pwd`
M2REPO=$BASEDIR/m2/rootfs/opt/m2
echo "M2REPO=$M2REPO"
VERSION=`cat repo-version/number`-SNAPSHOT
MESSAGE="[ci skip] Bump to Next Development Version ($VERSION)"

shopt -s dotglob
mv -f repo-staging/* release-out/
cd release-out
git remote add -f prod $BASEDIR/repo-prod
git merge --no-edit prod/master
echo "Bump to $VERSION"
if [ "x${PROJECT}" != "x" ];then
    cd ${PROJECT}
fi
mvn versions:set -DnewVersion=${VERSION} -DallowSnapshots -Dmaven.repo.local=$M2REPO
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add -A
git commit -m "${MESSAGE}"
