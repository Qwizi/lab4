#!/bin/bash

if [ "$1" = "--date" ]; then
    date +"%Y-%m-%d"

elif [ "$1" = "--logs" ]; then
    for (( i=1; i<=100; i++ )); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
else
    echo "Nieprawidłowa opcja. Użycie:"
    exit 1
fi