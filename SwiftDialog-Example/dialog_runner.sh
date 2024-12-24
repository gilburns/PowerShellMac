#!/bin/zsh

jsonString="$1"

if [[ -z "$1" ]]; then
    echo "Json argument missing"
    exit 1
fi

"/usr/local/bin/dialog" --alwaysreturninput --jsonstring "$jsonString" --json 2>/dev/null

response="$?"

echo "$response"
