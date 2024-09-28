#!/bin/bash

USERID=$ (id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e0m"

CHECK_ROOT(){
    if [$USERID -ne 0]; then
      echo "Please run this script with root priviliges"
      exit 1
}