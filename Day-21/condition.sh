#!/bin/bash

echo "=== Which tool is most important for DevOps? ==="

for TOOL in linux docker git kub8
do
	echo "$TOOL"
done


read -p "Enter your answer:" ANS

if [ ${ANS^^} = "LINUX" ]; then
	echo "Your answer is correct: ${ANS,,}"
else
	echo "Wrong answer"
fi
 

