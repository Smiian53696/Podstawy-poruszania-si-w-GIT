#!/bin/bash

show_date(){
    date
}

create_log(){
    for i in $(seq 1 $1); do
        echo "log$i.txt - Created by script script.sh on $(date)" > "log$i.txt"
    done
}

show_help(){
    echo "Available options:"
    echo "--date, -d: display today's date"
    echo "--logs, -l: create 100 log files logi.txt, numbered from 1 to 100"
    echo "--logs 30, -l 30: create specified number of log files, similar to above, but with support for specifying the number of files"
    echo "--help, -h: display all available options"
    echo "--init, -i: clone repository"
    echo "--error, -e: create errorx/errorx.txt"
}

init_repo() {
    git clone https://github.com/Volodymyr51775/Lab-4-Podstawa-praca-z-GIT.git
    repo_name=$(basename "https://github.com/Volodymyr51775/Lab-4-Podstawa-praca-z-GIT.git" .git)
    export PATH=$PATH:$(pwd)/$repo_name
    echo "Repository $repo_name cloned and added to PATH"
}

create_errors(){
    mkdir -p errorx
    for i in $(seq 1 ${1:-100}); do
        echo "error$i.txt - created by script script.sh" > "errorx/error$i.txt"
    done
}

case "$1" in
    --date|-d)
    show_date
    ;;
    --logs|-l)
    count=${2:-100}
    create_log $count
    ;;
    --help|-h)
    show_help
    ;;
    --error|-e)
    count=${2:-100}
    create_errors $count
    ;;
    --init|-i)
    init_repo
    ;;
    *)
    echo "Unknown option: $1"
    show_help
    ;;
esac
