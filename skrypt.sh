#!/bin/bash

echo "*log*" > .gitignore

case $1 in
    --date|-d)
        echo "Today's date: $(date)"
        ;;
    *)
        echo "Error, need at least one argument"
        exit 1
        ;;
esac