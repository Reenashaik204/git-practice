#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d "$SOURCE_DIR" ]; then
    echo   " source dir exists"
else
    echo " source dir doesnt exist"
    exit 1
fi        

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "fILES: $FILES"