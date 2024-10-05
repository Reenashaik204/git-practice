#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y+%m+%d+%H+%M+%s)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p "$LOGS_FOLDER"


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
CHECK_ROOT(){
    if [ "$USERID" -ne 0 ]; then
        echo -e "$R Please run the script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi       

}
 

 VALIDATE(){
    if [ $1 -ne 0 ]
    then
            echo -e "$R $2 is failed $N " | tee -a $LOG_FILE
            exit 1
    else        
            echo -e "$G $2 is success $N" | tee -a $LOG_FILE
    fi         


 }

 USAGE(){
    echo -e "$R USAGE::$N sudo sh 16-redirectors.sh package1 package2..."
    exit 1

 }

echo -e "$G script started executing at : $(date)" | tee -a $LOG_FILE


CHECK_ROOT

if [ $# -eq 0 ]; then
    USAGE
fi    

for package in "$@"    #$@ refers to all arguments passed to it
do 
  dnf list installed  $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
       echo "$package is not installed going to install it" | tee -a $LOG_FILE
       dnf install "$package" -y &>>"$LOG_FILE"
       VALIDATE $? "Installing $package"

    else 
       echo -e "$package is already installed" | tee -a $LOG_FILE
    fi

done           