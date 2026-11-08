#!/bin/bash
file="data.csv"
if [[ -f $file ]]; then
	echo "Reading $file"
	cat "$file"
else
	echo "Error: $file does not exist!"
	exit 1
fi

