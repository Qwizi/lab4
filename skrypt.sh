#!/bin/bash

if [ "$1" = "--date" ]; then
    date +"%Y-%m-%d"

elif [ "$1" = "--logs" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        num_logs="$2"
    else
        num_logs=100  # domyślnie 100 plików
    fi

    for (( i=1; i<=num_logs; i++ )); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
else
    echo "Nieprawidłowa opcja. Użycie:"
    exit 1
fi