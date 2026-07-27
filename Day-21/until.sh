#!/bin/bash


read -p "Enter any number" num

echo "num = $num"

until [ $num -eq 9 ]
do
	echo $num
	((num++))
done
