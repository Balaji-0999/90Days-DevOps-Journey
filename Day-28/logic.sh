#!/bin/bash

read -p "Enter your age: " age

if [ $age -ge 18 ] && [ $age -lt 100 ]; then
	echo "working age"

elif [ $age -lt 18 ] && [ $age -gt 0 ]; then
	echo "you are not eligible for work"
else
	echo "you are laying your not $age"
fi
