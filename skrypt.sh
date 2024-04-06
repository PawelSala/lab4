#!/bin/bash

echo "*log*" > .gitignore

create_logs() {  
    for ((i=1; i<=100; i++)); do
        echo "Log file $i" > "log$i.txt"
        echo "Created by: $0" >> "log$i.txt"
        echo "Creation date: $(date)" >> "log$i.txt"
    done
}

case $1 in
    --date)
        echo "Today's date: $(date)"
        ;;
    --logs)
        shift
        create_logs "$1"
        ;;
    *)
        echo "Error, need at least one argument"
        exit 1
        ;;
esac