#!/bin/bash

read -p "Enter file or directory name: " ITEM

if [ -f "$ITEM" ]; then
	echo "-f : it is not a directory"
#else
# 	echo "$ITEM is directory"
fi

if [ -d "$ITEM" ]; then
	echo "-d : It is directory"
fi

if [ -r "$ITEM" ]; then
	echo "-r : It is readable."
else
	echo "-r : It is not readable."
fi

if [ -w "$ITEM" ]; then
	echo "-w : It is writable."
else
	echo "-w : It is not writable"
fi

if [ -s $ITEM ]; then
	echo "-x : It is executable."
else 
	echo "-x : It is not executable."
fi

if [ -s "$ITEM" ]; then
	echo "-s : File is not empty."
else
	echo "-s : File is empty."
fi
