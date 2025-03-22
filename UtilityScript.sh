#!/bin/bash

#ask user if he wants to list files
read -p "Do you want to list all the files in current directory, sorted by size yes/no? " answer

if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then
# List all files in current directory, sorted by size (descending)
    echo -e "Here are the listed files in current directory sorted by size (descending): \n"
    ls -lhS | tail -n +2
    echo
else
    echo "You are always welcom to use my services to list your files"
fi 


# Count how many .txt files there are

read -p "Would like me to count how mant files there are yes/no? " answer2

if [[ "$answer2" == "yes" || "$answer2" == "Yes" ]]; then
    count=$(find . -type f -name "*.txt" | wc -l)
    # Using stat to get true file size (not disk usage)
    total_txt_bytes=$(find . -type f -name "*.txt" -exec stat -c %s {} + | awk '{sum+=$1} END {print sum}')
    # Convert total bytes to human-readable format
    total_txt_size=$(numfmt --to=iec --suffix=B --format="%.1f" "$total_txt_bytes")
    echo "$count .txt files, total size: $total_txt_size"
else
    echo "I'm always here for you, if you'll change your mind :) "

fi

read -p "Would like me to present you my conclusions? yes/no? " answer3
if [[ "$answer3" == "yes" || "$answer3" == "Yes" ]]; then

    # Show folder total size
    total_bytesdir=$(find . -type f -exec stat -c %s {} + | awk '{sum+=$1} END {print sum}')
    total_sizedir=$(numfmt --to=iec --suffix=B --format="%.1f" "$total_bytesdir")
        echo "Folder total size: $total_bytesdir bytes ($total_sizedir)"
    # If size is bigger than 5KB: for start just echo; then suggest to compress/delete

    if [[ "$total_bytesdir" -gt 5120 ]]; then   
        echo "Folder size is over 5KB, we suggest to compress or delete a file"
    else
        echo "Folder size is fine"
    fi
else 
    echo "Dont forget than I am always here for you <3"
fi
