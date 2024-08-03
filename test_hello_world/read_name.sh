#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install jq to use this script."
    exit 1
fi

# Check if config.json file exists
if [ ! -f config.json ]; then
    echo "config.json file not found!"
    exit 1
fi

# Extract the name from config.json using jq
name=$(jq -r '.name' config.json)

# Check if name was successfully extracted
if [ -z "$name" ]; then
    echo "Name not found in config.json!"
    exit 1
fi

# Print the name
echo "Name: $name"
