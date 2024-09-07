#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# Function to extract value from config.json
get_config_value() {
    key=$1
    value=$(jq -r ".$key" "$SCRIPT_DIR/config.json")
    
    # Check if the value was successfully extracted
    if [ -z "$value" ]; then
        echo "$key not found in config.json!"
        exit 1
    fi
    
    # Print the extracted value
    echo "$value"
}

# Main logic
if [ "$1" == "name" ]; then
    get_config_value "name"
elif [ "$1" == "env" ]; then
    get_config_value "env"
else
    echo "Usage: $0 {name|env}"
    exit 1
fi
