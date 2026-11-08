#!/bin/bash
json='{"name": "Peter", "age": 28}'
name=$(echo "$json" | jq -r '.name')
age=$(echo "$json" | jq -r '.age')
echo "Name: $name, Age: $age"
