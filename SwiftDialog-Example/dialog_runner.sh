#!/bin/zsh

jsonString="$1"

if [[ -z "$jsonString" ]]; then
    echo "Json argument missing"
    exit 1
fi

# remove the alwaysreturninput argument if you only want to see output when button1 is clicked.
"/usr/local/bin/dialog" --alwaysreturninput --jsonstring "$jsonString" --json 2>/dev/null

response="$?"

echo "$response"
