#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/functions.sh" ]]; then
	source "$SCRIPT_DIR/functions.sh"
else
	echo "[x] Error: functions.sh not found"
	exit 1
fi

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <username>"
	exit 1
fi

create_user "$1"
