#!/bin/bash
set -e
BASEDIR=`pwd`
if [ -d repo-version ];then
    VERSION=`cat repo-version/number`
    BOSH_OPTS="--version ${VERSION} --final"
else
    BOSH_OPTS="--timestamp-version"
fi

cd repo
${BASEDIR}/utils/scripts/generate-private-yml.sh
mkdir src
bosh -n create release --force --with-tarball ${BOSH_OPTS}
mv ./*releases/*/*.tgz ../releases/