#!/bin/bash
SERVICE="apache2"

if ! systemctl is-active --quiet $SERVICE; then
	systemctl start $SERVICE
	echo "Service $SERVICE was restarted" | mail -s "$SERVICE restarted" admin@example.com
fi
