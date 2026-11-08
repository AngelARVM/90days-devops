#!/bin/bash
long_process() {
	sleep 5
	echo "Process completed"
}

long_process &
pid=$!
wait $pid
