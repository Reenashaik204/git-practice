#!/bin/bash

echo "Please enter your name: "
read username
echo "The user name you enterd is: $username"
echo "confirm if it's correct (yes/no) :"
read answer

if [ "$answer" = "Yes" ] || [ "$answer" = "yes" ];then
      echo "Thank you, $username!"
else
      echo "Please enter your correct username. Thank you!"

fi
