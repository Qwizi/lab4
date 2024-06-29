#!/bin/bash

if [ "$1" = "--date" ]; then
    date +"%Y-%m-%d"
else
    echo "Nieprawidłowa opcja. Użycie: skrypt.sh --date"
    exit 1
fi