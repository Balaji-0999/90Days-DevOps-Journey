#!/bin/bash

read -p "Enter file/directory name: " item

if [ -f "$item" ]; then
	echo "$item is a regular file"
elif [ -d "$item" ]; then 
	echo "$item is a directory"
else
	echo "$item does not exits"
fi
