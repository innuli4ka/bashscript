#!/usr/bin/bash
delete_by_extension() {
        echo "enter the file extension to delete (e.g., txt, log):"
        read ext
        
        count=$(ls *.$ext 2>/dev/null | wc -l)
        if [ "$count" -eq 0 ]; then
                echo "no .$ext files found."
                return
        fi    
	total_size=$(du -ch *.$ext 2>/dev/null | grep total | cut -f1)
	echo "this will delete $count .$ext files, total size: $total_size. are you sure? (yes/no)"
	read confirm
	if [ "$confirm" == "yes" ]; then
		rm -f *.$ext
		echo "deleted all .$ext files."
	else
		echo "operation canceled"
	fi
}
delete_by_extension


