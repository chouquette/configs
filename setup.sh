#! /bin/sh

SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $0)

for file in $(ls -A "$SCRIPT_PATH"); do
    if [ "$file" != "$SCRIPT_NAME" ] && [ "$file" != ".git" ]; then
        ln -s "$SCRIPT_PATH"/"$file" "$HOME"/"$file"
    fi
done
