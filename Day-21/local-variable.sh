#!/bin/bash

NAME=kachi

demo() {
	local NAME="DevOps"
	echo "Inside function : $NAME"
}

demo
echo "Outside function: $NAME"
