#!/bin/bash

read -p "Enter: " CHOICE

case $CHOICE in
    start) echo "Starting";;
    stop) echo "Stopping";;
    *) echo "Invalid";;
esac
