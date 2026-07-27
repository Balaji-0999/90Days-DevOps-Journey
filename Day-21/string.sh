#!/bin/bash

<<usage
=
!=
-z
-n

usage


NAME="$1"


if [ -z "$NAME" ]; then
	echo "No name provided."
elif [ "$NAME" = "bala ji" ]; then
	echo "Hello bala ji"
elif [ "$NAME" != "bala ji" ] && [ -n "$NAME" ]; then
	echo "Hello $NAME you are not bala ji."
fi

