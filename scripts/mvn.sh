#!/bin/sh
set -e

MVN_COMMAND=$1
TARGET_DIR=$2

if [ "$MVN_COMMAND" == "" ];then
    MVN_COMMAND=validate
fi

if [ "$TARGET_DIR" == "" ];then
    TARGET_DIR=.
fi

BASE_DIR=`pwd`
M2REPO=$BASE_DIR/m2/rootfs/opt/m2
echo "M2REPO=$M2REPO"

cd $TARGET_DIR
mvn $MVN_COMMAND -Dmaven.repo.local=$M2REPO
cd $BASE_DIR