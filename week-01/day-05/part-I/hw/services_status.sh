#!/bin/bash

SERVICES=("nginx" "mysql" "docker")
DOWN_SERVICES=()

for service in "${SERVICES[@]}"; do
	if systemctl is-active --quiet "$service"; then
		echo "$service: Active"
	else
		echo "$service: Inactive"
		DOWN_SERVICES+=("$service")
	fi
done

if [ ${#DOWN_SERVICES[@]} -gt 0 ]; then
	EMAIL="admin@example.com"
	SUBJECT="Alert: Services Down"
	BODY="The following services are down: ${DOWN_SERVICES[*]}"
	echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
	echo "Alert email sent"
fi
