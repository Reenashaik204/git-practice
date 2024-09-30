#!/bin/bash

USERID=$( id -u )

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]; then
      echo -e "$R Please run this script with root priviliges $N "
      exit 1
    fi

}
VALIDATE(){
  if [  $1 -ne 0 ]; then
     echo -e "$G $2 is failed $N "
     exit 1
  else
     echo -e "$G $2 is success $N "

  fi

}


CHECK_ROOT

# sh 15-loops.sh git mysql nginx postfix
for package in $@ #refers to all args passed to it
do 
   dnf list installed $package
   if [ $? -ne 0]; then

       echo -e "$Y $package is not installed, going ot install it $N"
       dnf install $package -y
       VALIDATE $? "Installing $package" 
    else
       echo -e " $G $package is already isntalled, nothing to install $N"   

done    