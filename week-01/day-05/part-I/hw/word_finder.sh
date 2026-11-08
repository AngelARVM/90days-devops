#!/bin/bash

FILE="$1"
WORD="$2"

if [ -z "$FILE" ] || [ -z "$WORD" ]; then
	echo "Usage: $0 <file> <word>"
	exit 1
fi

if grep -q "$WORD" "$FILE"; then
	echo "Found!"
else
	echo "Not found"
fi

