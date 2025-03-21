#!/bin/bash

# List all files in current directory, sorted by size (descending) ---
echo "Listing files in current directory sorted by size (descending):"
ls -lhS 
echo

# Count how many .txt files there are
count=$(find . -type f -name "*.txt" | wc -l)

# Calculate total actual size of .txt files
# Using stat to get true file size (not disk usage)
total_txt_bytes=$(find . -type f -name "*.txt" -exec stat -c %s {} + | awk '{sum+=$1} END {print sum}')

# Convert total bytes to human-readable format
total_txt_size=$(numfmt --to=iec --suffix=B --format="%.1f" "$total_txt_bytes")

# Output the result ---
echo "$count .txt files, total size: $total_txt_size"

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
