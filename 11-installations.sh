#!/bin/bash

USERID=$( id -u )

#echo "user id is: $USERID"

    if [ $USERID -ne 0 ]; then
        echo "Please run the script with root privileges"
        exit 1
    else    
        echo "Script is running with root privileges"    
    fi

    dnf list installed git

    dnf list installed mysql

    if [ $? -ne 0 ]; then
      echo "mysql not installed, going to install"
      dnf install mysql -y
        if [ $? -ne 0] ; then
          echo "mysql installation not successful"
        else
          echo "mysql installation success"
        fi
    else
      echo "mysql is already installed"   
    fi