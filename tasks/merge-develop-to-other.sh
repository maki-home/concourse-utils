#!/bin/bash
set -e

BASEDIR=`pwd`
shopt -s dotglob
mv -f repo-other/* other-out/
cd other-out
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git remote add -f dev $BASEDIR/repo-dev
git merge --no-edit dev/develop