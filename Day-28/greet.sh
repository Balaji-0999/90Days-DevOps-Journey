#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "usage: $0 <name>"
	exit 1
fi
echo "Hello,$1  $2  $3"
