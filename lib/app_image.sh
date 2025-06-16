#!/bin/bash

i_appimage () {
    command="$1"

    filename="${2##*/}"
    filepath="$2"

    devdep=$(apt list fuse 2>/dev/null | grep -c "installed")
    if [ $devdep -eq 0 ]; then
        echo "Installing required dependencies..."
        sudo apt-get install fuse
    fi

    if [ ! -d "/usr/apps/bin" ]; then
        sudo mkdir -p /usr/apps/bin
        sudo chmod 777 /usr/apps/bin
        
    fi

    sudo mv $filepath /usr/apps/
    sudo chmod 755 "/usr/apps/$filename"
    sudo echo "/usr/apps/$filename" > "/usr/apps/bin/$command"
    sudo gcc "/usr/apps/bin/$command.c" -o "/usr/apps/bin/$command"
    sudo rm "/usr/apps/bin/$command.c"
    sudo chmod 777 "/usr/apps/bin/$command"
}