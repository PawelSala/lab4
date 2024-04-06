#!/bin/bash

echo "*log*" > .gitignore

show_help() {
    echo "Usage: skrypt.sh [OPTION]"
    echo "Options:"
    echo "  --date, -d          Display today's date"
    echo "  --logs [N], -l [N]  Create N log files (default: 100)"
    echo "  --help, -h           Display this help message"
    echo "  --init               Clone the repository and add it to PATH"
    echo "  --error [N], -e [N]  Create N error files (default: 100)"
    echo "  --version, -v        Display script version"
}

create_logs() {
    local count=${1:-100}
    for ((i=1; i<=$count; i++)); do
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
    --help)
        show_help
        ;;
    *)
        echo "Error, need at least one argument"
        exit 1
        ;;
esac