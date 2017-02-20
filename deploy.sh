#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

cd stage/_book

git init
git config user.name "Lucas Gautheron"
git config user.email "lucas.gautheron@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/lucasgautheron/tribune.insoumis.online.git"
git fetch upstream

nikola github_deploy
