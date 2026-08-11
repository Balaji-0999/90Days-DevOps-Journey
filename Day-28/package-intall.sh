#!/bin/bash


read -p "Enter you package: " pakg

dpkg -s $pakg &>/dev/null && echo "$pakg installed " || echo "$pakg is not installed"
