#!/bin/bash

if [ -z "$1" ]
	then
		echo "Path not specified"
		exit 1
fi

if [ ! -d "$1" ]
	then
		echo "Directory does not exist"
		exit 1
fi

find "$1" -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.backup" \) -delete

echo "Directory cleanup completed successfully"
