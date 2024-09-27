#!/bin/bash

USERID=$( id -u )

#echo "user id is: $USERID"

    if [ $USERID -ne 0 ]; then
        echo "Please run the script with root privileges"
        exit 1
    else    
        echo "Script is running with root privileges"    
    fi