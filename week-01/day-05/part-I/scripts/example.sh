#!/bin/bash

# variables
username="Jay"
filename=$3

# user input
read -p "Type your username" user
echo "your username: $user"

# conditional if
if [ "$EUID" -ne 0 ]; then
	echo "You are not root"
else
	echo "Your are root"
fi

# for loop
echo "Counting to 5:"
for i in {1..5}; do
	echo "$i"
done

# functions
function salute() {
	echo "Hello, $1"
}
salute "Alice"

# conditional case
echo "Type a number between 1 & 2:"
read num
case $num in
	1) echo "You choose one." ;;
	2) echo "You choose two." ;;
	*) echo "Invalid option." ;;
esac

# file's operations
if [ -e "$filename" ] && [ -d "$filename" ]; then
	echo "File exists and it's a directory."
else
	echo "File doesn't exists or it's not a directory"
fi

# arguments
echo "First argument: $1"
echo "Second argument: $2"

# outputs
cat nonexisten-file.txt 2> /dev/null
echo "Output: $?"

# indexed arrays
fruits=("Apple" "Orange" "Banana")
echo "First fruit: ${fruits[0]}"

# arrays
declare -A capitals
capitals[USA]="Washington D.C."
capitals[France]="Paris"
echo "France's capital: ${capitals[France]}"

# command substitution
today=$(date)
echo "The current date is: $today"

# command redirection
echo "Sample text." > example.txt
find ./ -name hello.tt &> /dev/null

# Arithmetic operations
result=$((15 / 2))
echo "Result: $result"

# expand parameter
SRC="/ruta/a/foo.cpp"
BASE=${SRC%/*}
echo "Base directory: $BASE"

# System signal handling
trap 'echo "Received SIGTERM. Closing..."; exit' SIGTERM

: '
Multi-line
comment
'
