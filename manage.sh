#!/bin/bash

# script js writed file in history folder
node /home/r/jjj/write_file.js

path_initial=/home/r/jjj/history
path_file_add=$path_initial/get-add-firebase.txt
path_update_file=$path_initial/get-update-firebase.txt

date=$(date +%d-%m-%Y-%H:%M:%S)

if [ -f "$path_file_add" ]; then
    scp $path_file_add ubuntu@13.229.249.92:/home/ubuntu/get-add-firebase.txt
    mv $path_file_add $path_initial/get-add-firebase-$date.txt
    /home/r/jjj/run1.sh
fi

if [ -f "$path_update_file" ]; then
    scp $path_update_file ubuntu@13.229.249.92:/home/ubuntu/get-update-firebase.txt
    mv $path_update_file $path_initial/get-update-firebase-$date.txt
    /home/r/jjj/run1.sh
fi




