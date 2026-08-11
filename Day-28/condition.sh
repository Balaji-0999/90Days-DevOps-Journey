#!/bin/bash

read -p "Enter your age : " age

if [ $age -gt 18 ]; then
	echo "your are an adult"
elif [ $age -lt 18 ] && [ $age -gt 0 ]
then
	echo "you are a minor"
else
	echo "invalide age"
fi
