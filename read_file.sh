#!/bin/bash

path_file_add=/home/ubuntu/get-add-firebase.txt
path_file_update=/home/ubuntu/get-update-firebase.txt

if [ -f "$path_file_add" ]; then
    n=1
    echo "ADD"
    while read -r line; do
    echo "Line No. $n: ${line:0:3}"
    
    if [ ${line:0:3} == "psu" ]; then
        username=$line
    else
        ssh_key=$line
        echo "$username : $ssh_key"
        sudo /home/ubuntu/add.sh $username $ssh_key
    fi

    n=$((n+1))
    done < "$path_file_add"
fi

if [ -f "$path_update_file" ]; then
    n=1
    echo "UPDATE"
    while read -r line; do
    echo "Line No. $n: ${line:0:3}"
    if [ ${line:0:3} == "psu" ]; then
        username=$line
    else
        ssh_key=$line
        echo "$username : $ssh_key"
        sudo /home/ubuntu/update.sh $username $ssh_key
    fi
    n=$((n+1))
    done < "$path_update_file"
fi



