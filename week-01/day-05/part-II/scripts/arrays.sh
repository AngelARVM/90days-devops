#!/bin/bash

files=("doc1.txt" "doc2.txt" "report.pdf")

for file in "${files[@]}"; do
	echo "Processing $file"
done
