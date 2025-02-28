#!/bin/bash
#
#
if [ -z "$1" ]; then
	echo "usage: $0 <username>"
	exit 1
fi

username=$1
group="devops"

if getent group "$group" $> /dev/null; then
	echo "group exists"
else
	groupadd $group
        echo " group added successfully"
fi


if id $username &>/dev/null; then
	echo "user already exists"
else
	sudo useradd -m -G "$group" "$username"

	if id $username &> /dev/null; then
		echo " user '$username' has been created and added to the '$group' "
	else
		echo " failed to create user"
	fi
fi
