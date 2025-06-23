#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

source "$SCRIPT_DIR/lib/app_image.sh"
source "$SCRIPT_DIR/lib/deb.sh"

VER=1.3

args=$(getopt -o h --long help,version,image,deb -n "$0" -- "$@")
if [ $? != 0 ]; then
    echo "Usage: $0 [command_name] [path_to_executable]"
    exit 1
fi

eval set -- "$args"

version=false
help=false

echo_help() {
    echo "Usage: mkcmd [type] [command_name] [path_to_executable]
File type will be considered to be appImage if type is not provided"
    echo "Types:
    --image : For .appImage files
    --deb   : For .deb files"
    echo "Additional flags:
    -h, --help      Show this help message
    --version       Show version information"
}

echo_version() {
    echo "mkcmd version $VER"
}

image=false
deb=false

while true; do
    case "$1" in
        -h|--help) help=true; shift ;;
        --version) version=true; shift ;;
        --image) image=true; shift ;;
        --deb) deb=true; shift;;
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
    echo "Usage: $0 [type] [command_name] [path_to_executable]"
    exit 1
fi

types=0

$image && ((types++))
$deb && ((types++))

if [[ $types -gt 1 ]]; then
    echo "You can not specify more than one type in a command"
    exit 1
fi

if [[ $types -eq 0 ]]; then
    image=true
fi

if [[ "$image" = true ]]; then
    i_appimage $@
fi

if [[ "$deb" = true ]]; then
    i_deb $@
fi