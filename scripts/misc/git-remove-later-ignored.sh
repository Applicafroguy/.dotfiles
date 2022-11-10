#!/bin/env bash

export FILTER_BRANCH_SQUELCH_WARNING=1
FILES=$(git ls-files --cached -i --exclude-standard)
for file in $FILES; do
  echo $file
  git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch $file" \
  --prune-empty --tag-name-filter cat -- --all
done

