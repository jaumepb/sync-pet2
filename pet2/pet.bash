#!/bin/bash 
#LAST_COMMIT=$(curl -s $CIRCLE_COMPARE_URL | grep -oE 'commit/[a-f0-9]+' | cut -d'/' -f2)
LAST_COMMIT=$(git log --pretty=format:"%H" --skip=1 -n 2 | tail -n 1)
CHANGED_FILES=$(git diff --name-only $LAST_COMMIT $CIRCLE_SHA1)
echo $CHANGED_FILES
for line in $CHANGED_FILES 
do
  if echo "$line" | grep -q '^docker-yt-dlp/'; then
    echo "^docker-yt-dlp"
  elif echo "$line" | grep -q '^pet2/'; then
    echo "pet2"
  else
    echo "$LAST_COMMIT -> $line - Nothing to do for this directories."
  fi
done
