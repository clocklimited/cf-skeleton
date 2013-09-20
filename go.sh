#!/bin/sh

read -e -p "Name of package: " name
read -e -p "Description of package: " description
read -e -p "Github Owner: [clocklimited] " githubUser
read -e -p  "Author: [Paul Serby <paul.serby@clock.co.uk>] " author

githubUser=${githubUser:-clocklimited}
author=${author:-Paul Serby <paul.serby@clock.co.uk>}

sed -i -e "s/{NAME}/$name/g" README.md package.json
sed -i -e "s/{DESCRIPTION}/$description/g" README.md package.json
sed -i -e "s/{GITHUBOWNER}/$githubUser/g" README.md package.json
sed -i -e "s/{AUTHOR}/$author/g" README.md package.json

rm *.*-e
rm go.sh
rm -rf .git

git init .
git add -A
git commit -am 'Initial commit'