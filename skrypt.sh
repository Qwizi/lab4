#!/bin/bash

REPO_URL="https://github.com/Qwizi/lab4.git"

function display_help() {
    echo "Użycie: $0 <opcja>"
    echo "  $0 --date        : Wyświetla dzisiejszą datę"
    echo "  $0 --logs [liczba]: Tworzy podaną liczbę plików logx.txt (domyślnie 100), gdzie x to numer pliku"
    echo "  $0 --help        : Wyświetla pomoc"
}

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date +"%Y-%m-%d"

elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
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


elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        num_errors="$2"
    else
        num_errors=100  # domyślnie 100 plików
    fi

    mkdir -p errorx

    for (( i=1; i<=num_errors; i++ )); do
        filename="errorx/error${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done

elif [ "$1" = "--init" ]; then
    git clone $REPO_URL ./
    export PATH=$(pwd):$PATH
    echo "Repozytorium zostało pomyślnie sklonowane i ścieżka została ustawiona w PATH."

elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    display_help

else
    echo "Nieprawidłowa opcja: $1"
    display_help
    exit 1
fi