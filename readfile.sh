#!/bin/bash

function firstfunc() {
    while IFS= read -r line; do
        echo "$line"
    done < "$path"
}

function secondfunc() {
    echo "Number of words: $(wc -w < "$path")"
    echo "Number of lines: $(wc -l < "$path")"
    echo "Size of file (bytes): $(wc -c < "$path")"

    if [[ -n "$1" ]]; then
        if grep -q "$1" "$path"; then
            awk -v termToSearch="$1" '
            {
                count = 0;
                for (i = 1; i <= NF; i++) {
                    count++;
                    if ($i == termToSearch) {
                        print "true, word num:", count;
                    }
                }
            }' "$path"
        fi
    fi
}

while true; do
    echo "Enter path of file:"
    read -r path
    if [[ ! -e "$path" ]]; then
        echo "Bad path, try again."
        continue
    else
        break
    fi
done

firstfunc
echo "Enter term to search:"
read -r term
secondfunc "$term"
