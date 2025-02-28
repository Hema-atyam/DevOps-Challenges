#!/bin/bash
#
#
packages=("git" "curl" "vim")

for package in ${packages[@]}; do
	if ! command -v "$package" &> /dev/null; then
		echo "installing the packages"
		sudo apt-get install -y "$package"
	else
		echo "$package already installed"
	fi
done
