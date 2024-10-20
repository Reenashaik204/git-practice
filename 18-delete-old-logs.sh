#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d "$SOURCE_DIR" ]; then
    echo   " source dir exists"
else
    echo " source dir doesnt exist"
    exit 1
fi        