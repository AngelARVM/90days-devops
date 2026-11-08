#!/usr/bin/env bash
declare -A colors
colors[red]="#FF0000"
colors[green]="#00FF00"
for color in "${!colors[@]}"; do
	echo "$color: ${colors[$color]}"
done
