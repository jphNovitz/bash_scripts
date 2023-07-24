#!/bin/bash

echo "**********************************"
echo "* start laravel Sail and npm dev *"
echo "**********************************"
echo "jphnovite (june 2023)"
echo ""

if [ x"${folder}" == "x" ]
then
    echo "In which path ?"
    echo "** Starting inside current user home directory"
    read  path
fi

if [ -d "/home/$USER/$path" ]
then
    echo $path" exists"
else
    echo $path" doesn\'t exist"
    exit 1
fi

if (! pgrep -f docker > /dev/null)
then
    echo "Start Docker"
    sudo service docker start
    sleep 10s
    echo " "
else
    echo "Docker is running ..."
fi

echo "Going to "$path" folder"
cd /home/$USER/$path/


echo "Starting sail"
./vendor/bin/sail up -d
sleep 10s

./vendor/bin/sail npm run watch


exec bash
