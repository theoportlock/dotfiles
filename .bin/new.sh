#!/bin/bash

# Set the target file name based on the current date
file=$(date +%F)

# Check if a file with the current date exists
if [ ! -f "$file" ]; then
    # Find the most recent file in the format YYYY-MM-DD (e.g., 2024-01-04)
    recent_date_file=$(ls | grep -E '^2[0-9]{3}-[0-1][0-9]-[0-3][0-9]' | tail -1)
    
    if [ -n "$recent_date_file" ]; then
        # If a recent date-formatted file exists, copy its content to the current date file
        cat "$recent_date_file" > "$file"
    fi
fi

# Open the file in vim (either the new date file or a fallback file if no date files were found)
vim "$file"
