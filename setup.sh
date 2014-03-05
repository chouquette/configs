#! /bin/sh

SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $0)

cd $SCRIPT_PATH
git submodule init
git submodule update
cd -

for file in $(ls -A "$SCRIPT_PATH"); do
    if [ "$file" != "$SCRIPT_NAME" ] && [ "$file" != ".git" ] && [ "$file" != ".gitmodules" ]; then
        ln -s "$SCRIPT_PATH"/"$file" "$HOME"/"$file"
    fi
done
