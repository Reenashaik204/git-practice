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

dnf list installed git

if [ $? -ne 0 ]
then
    echo -e "$R Git is not installed, going to install it..$N "
    dnf install git -y
    VALIDATE $? -e "$Y Installing Git $N "
else
    echo -e "$G Git is already installed, nothing to do..$N "
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "$R MySQL is not installed...going to install $N"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "$Y MySQL is already installed..nothing to do $N "
fi
  
