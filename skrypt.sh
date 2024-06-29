#!/bin/bash

function display_help() {
    echo "Użycie: $0 <opcja>"
    echo "  $0 --date        : Wyświetla dzisiejszą datę"
    echo "  $0 --logs [liczba]: Tworzy podaną liczbę plików logx.txt (domyślnie 100), gdzie x to numer pliku"
    echo "  $0 --help        : Wyświetla pomoc"
}

if [ "$1" = "--date" ]; then
    date +"%Y-%m-%d"

elif [ "$1" = "--logs" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        num_logs="$2"
    else
        num_logs=100
    fi

    for (( i=1; i<=num_logs; i++ )); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
elif [ "$1" = "--help" ]; then
    display_help

else
    echo "Nieprawidłowa opcja: $1"
    display_help
    exit 1
fi