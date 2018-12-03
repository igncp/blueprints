#!/usr/bin/env bash

FILE_PATH=GIT_UNTRACKED/questions.txt

echo "" > "$FILE_PATH"

find ./tests -type f -name 'QUESTIONS.txt' | while read -r LINE; do
  printf "# >>> $LINE\n\n" >> "$FILE_PATH"

  cat "$LINE" >> "$FILE_PATH"

  printf "\n\n\n\n\n\n\n\n" >> "$FILE_PATH"
done

sed -r 's|:.*$||' glossary.txt >> "$FILE_PATH"

$EDITOR "$FILE_PATH"
