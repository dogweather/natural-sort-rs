#!/bin/bash

rev=$(git rev-parse --short HEAD)

cargo doc --no-deps

cd target/doc

git init
git config user.name "Steve Klabnik"
git config user.email "steve@steveklabnik.com"

git remote add upstream "https://$GH_TOKEN@github.com/ucarion/natural-sort-rs.git"
git fetch upstream && git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
