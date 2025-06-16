#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

source "$SCRIPT_DIR/lib/app_image.sh"

VER=1.2

args=$(getopt -o h --long help,version -n "$0" -- "$@")
if [ $? != 0 ]; then
    echo "Usage: $0 [command_name] [path_to_executable]"
    exit 1
fi

eval set -- "$args"

version=false
help=false

echo_help() {
    echo "Usage: mkcmd [command_name] [path_to_executable]"
    echo "Options:"
    echo "  -h, --help      Show this help message"
    echo "  --version       Show version information"
}

echo_version() {
    echo "mkcmd version $VER"
}

while true; do
    case "$1" in
        -h|--help) help=true; shift ;;
        --version) version=true; shift ;;
        --) shift; break ;;
        *) echo "Some error occurred" >&2; exit 1 ;;
    esac
done

if [ "$version" = true ]; then
    echo_version
    exit 0
elif [ "$help" = true ]; then
    echo_help
    exit 0
fi

if [ $# -ne 2 ]; then
    echo "Usage: $0 [command_name] [path_to_executable]"
    exit 1
fi

i_appimage $@
