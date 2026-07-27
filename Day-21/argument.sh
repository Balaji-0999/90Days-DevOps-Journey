#!/bin/bash

echo "./argument.sh     : $0"
echo "First Argument    : $1"
echo "Second Argument   : $2"
echo "Total Arguments   : $#"
echo "All Arguments     : $@"

ls /tmp > /dev/null
echo "Exit Status of is:  $?"

echo

ls script.sh > /dev/null
echo $?

echo 

mkdir demo
echo $?



# $0 = hello.sh

# $1 = Docker

# $2 = AWS

# $3 = Linux

# $# = 3

# $@ = Docker AWS Linux
