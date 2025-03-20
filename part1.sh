#!/bin/bash

# Function to list all files in the home directory sorted by size
echo_sorted_files() {
    local order=$1
    if [[ "$order" == "asc" ]]; then
        find $HOME -type f -exec ls -lhS {} + | sort -h
    else
        find $HOME -type f -exec ls -lhS {} +
    fi
}

# Function to count files by extension and show total size
count_files_by_extension() {
    local ext="$1"
    local count=$(find $HOME -type f -name "*.$ext" | wc -l)
    local size=$(find $HOME -type f -name "*.$ext" -exec du -ch {} + | grep total$ | awk '{print $1}')
    echo "$count .$ext files, total size: $size"
}

# Function to show total folder size
show_folder_size() {
    local threshold=$1
    local total_size=$(du -sh $HOME | awk '{print $1}')
    echo "Total home directory size: $total_size"
    
    if [[ $(du -s $HOME | awk '{print $1}') -gt $threshold ]]; then
        echo "Warning: Home directory size exceeds $threshold KB."
        suggest_action
    fi
}

# Function to suggest action
suggest_action() {
    echo "Would you like to compress or delete files? (compress/delete/skip)"
    read action
    case $action in
        compress)
            tar -czf $HOME/backup.tar.gz $HOME/*
            echo "Files compressed into $HOME/backup.tar.gz"
            ;;
        delete)
            echo "Are you sure? (yes/no)"
            read confirm
            if [[ "$confirm" == "yes" ]]; then
                rm -rf $HOME/*
                echo "Files deleted."
            fi
            ;;
        skip)
            echo "No action taken."
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

# Example usage
echo "Listing all files in the home directory sorted by size (asc):"
echo_sorted_files "asc"

echo "\nListing all files in the home directory sorted by size (desc):"
echo_sorted_files "desc"

echo "\nCounting .txt files:"
count_files_by_extension "txt"

echo "\nChecking home directory size:"
show_folder_size 100000  # Threshold set to 100MB (100000 KB)
