#!/bin/bash

#Function to delete all contents in a directory
#made by sagi madai

delete_all_files() {
	local directory=$1
	local files_count=$(ls $directory | wc -l)
	local total_du=$(du -sh $directory | cut -f1)
	echo "Are you sure you want to delete $files_count
files and $total_du from $directory? (yes/no) "
	read answer 
	if [ $answer == yes ];then
		rm -r $directory/*
		echo "All files deleted from $1"
	else
		echo "Deletion canceled"
	fi

    
}

echo "Enter the folder path: "
read folder_path
delete_all_files "$folder_path"
