#!/bin/bash

USER=$(whoami)
BACKUP_DIR="/home/$USER/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DEST_FILE="$BACKUP_DIR/var_log_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "compressing /var/log.."

sudo tar -czf "$DEST_FILE" /var/log 2>/dev/null

if [ $? -eq 0 ]; then
	echo "Backup created successfully at: $DEST_FILE"
else
	echo "Error compressing /var/log."
	exit 1
fi

echo "Searching and removing old backups"
find "$BACKUP_DIR" -type f -name "var_log_*.tar.gz" -mtime +7 -exec rm -f {} \;
echo "Success"
