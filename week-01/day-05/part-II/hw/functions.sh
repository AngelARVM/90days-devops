#!/bin/bash

create_user() {
	local username="$1"
	if [[ "$OSTYPE" == "darwin"* ]]; then
		if ! dscl . -read "/Users/$username" &>/dev/null; then
   			echo "User does not exist, proceeding to create..."
		fi
	else
    		echo "[x] user already exists"
    		return 2
	fi
	
	if [[ "$OSTYPE" = "darwin"*  ]]; then
		echo "[x] automated user creation"
		return 2
	else
		if sudo useradd "$username"; then
			echo "[$(date '+%Y-%m-%d %H:%M:%S')] User '$username' created successfully" >> users.log
			echo "[+] User '$username' created successfully"
			return 0
		else
			echo "[x] Error trying to create user '$username'"
			return 2
		fi
	fi 
}
