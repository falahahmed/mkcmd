#!/bin/bash

start(){
    if [ $# -lt 2 ]; then
        echo "Usage: $0 <command_name> <path_to_executable>"
        return 0
    fi

    command="$1"

    filename="${2##*/}"
    filepath="$2"

    if [ ! -d "$/usr/apps" ]; then
        sudo mkdir -p /usr/apps
    fi
    if [ ! -d "/usr/apps/bin" ]; then
        sudo mkdir -p /usr/apps/bin
        sudo chmod 777 /usr/apps/bin
    fi

    sudo mv $filepath /usr/apps/
    sudo echo "#include<stdlib.h>
    int main(){
        system(\"/usr/apps/$filename\");
    }
    " > "/usr/apps/bin/$command.c"
    sudo gcc "/usr/apps/bin/$command.c" -o "/usr/apps/bin/$command"
    sudo rm "/usr/apps/bin/$command.c"
    sudo chmod 777 "/usr/apps/bin/$command"
}

start $@

