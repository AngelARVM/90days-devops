#!/bin/bash
text="User: Maria, Email: maria@example.com"
if [[ $text =~ User:\ ([^,]+)\ Email:\ ([^ ]+) ]]; then
	user=${BASH_REMATCH[1]}
	email=${BASH_REMATCH[2]}
	echo "User: $user, Email: $email"
fi
