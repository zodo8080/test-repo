#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print the script directory
# echo "Script Directory: $SCRIPT_DIR"

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install jq to use this script."
    exit 1
fi

# Check if config.json file exists in the same directory as the script
if [ ! -f "$SCRIPT_DIR/config.json" ]; then
    echo "config.json file not found in $SCRIPT_DIR!"
    exit 1
fi

# Extract the name from config.json using jq
name=$(jq -r '.name' "$SCRIPT_DIR/config.json")

# Check if name was successfully extracted
if [ -z "$name" ]; then
    echo "Name not found in config.json!"
    exit 1
fi

# Print the name
echo "Name: $name"
