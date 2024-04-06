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

create_errors() {
    local count=${1:-100}
    mkdir -p errorx
    for ((i=1; i<=$count; i++)); do
        echo "Error file $i" > "errorx/error$i.txt"
        echo "Created by: $0" >> "errorx/error$i.txt"
        echo "Creation date: $(date)" >> "errorx/error$i.txt"
    done
}

case $1 in
    --date|-d)
        echo "Today's date: $(date)"
        ;;
    --logs|-l)
        shift
        create_logs "$1"
        ;;
    --help|-h)
        show_help
        ;;
    --init|-i)
        git clone https://github.com/PawelSala/lab4 "$PWD/lab4_clone"
        PATH=$PATH:$PWD/lab4_clone
        ;;
    --error|-e)
        shift
        create_errors "$1"
        ;;
    *)
        echo "Error, need at least one argument"
        exit 1
        ;;
esac