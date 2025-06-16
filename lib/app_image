#!/bin/bash

i_appimage () {
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