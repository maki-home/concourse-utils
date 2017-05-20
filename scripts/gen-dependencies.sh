#!/bin/bash
set -e
TARGET_DIR=$1

if [ "$TARGET_DIR" == "" ];then
    TARGET_DIR=.
fi

BASE_DIR=`pwd`
M2REPO=$BASE_DIR/m2/rootfs/opt/m2
echo "M2REPO=$M2REPO"

cd $TARGET_DIR

PROPS=target/classes/bootstrap.properties 
if [ ! -f $PROPS ];then
	PROPS=target/classes/applications.properties 
	if [ ! -f $PROPS ];then
		echo "application.properties nor bootstrap.properties is not found."
		exit 0
	fi
fi

DEPS=`mvn dependency:list -Dmaven.repo.local=$M2REPO | grep -e compile -e runtime | awk '{print $2}' | sort`
VALS=
i=0
echo >> $PROPS
for d in $DEPS;do
	echo "info.maven.dependencies[$i]=$d" >> $PROPS
	i=$((i + 1))
done
cd $BASE_DIR