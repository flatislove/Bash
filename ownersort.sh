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

dir="$1"
files=$(find "$dir" -maxdepth 1 -type f)

for file in $files
	do
		owner=$(stat -c '%U' "$file")
		if [ ! -d "$dir/$owner" ]
			then
				mkdir "$dir/$owner"
				chown "$owner" "$dir/$owner"
    		fi
    		if [ ! -f "$dir/$owner/$(basename "$file")" ]
			then
        			cp -p "$file" "$dir/$owner"
    		fi
done

echo "Done!"
