#!/bin/bash


read -p "Enter Any Number:" NUM

echo "Number = $NUM"

if [ $NUM -eq 10 ]; then
	echo "-eq : Number is equal to 10"
fi

if [ $NUM -ne 5 ]; then
	echo "-ne : Number is not equal to 5"
fi

if  [ $NUM -lt 20 ]; then
	echo "-lt : Number is less then 20"
fi

if [ $NUM -gt 5 ]; then
	echo "-gt : Number is greater than 5"
fi

if [ $NUM -le 10 ]; then
	echo "-le : Number is less then or equal to 10"
fi

if [ $NUM -ge 10 ]; then
	echo "-ge : Number is greater than or equal to 10"
fi

