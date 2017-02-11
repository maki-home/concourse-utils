#!/bin/sh
cd repo
mvn clean install -Dmaven.repo.local=../m2/rootfs/opt/m2
cd ../m2
tar -C rootfs -cf rootfs.tar .
mv rootfs.tar ../output