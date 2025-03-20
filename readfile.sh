#!/bin/bash
function firstfunc() {

}
while true; do
	echo "enter path of file"
	read path
	if [[ ! -e "$path" ]]; then
		echo "bad path, try again"
		continue
	fi
	echo "choose option:"
	echo "1. print line by line"
	echo "2. return word count, line number and total file size"
	echo "3. search function"
	read op
		if [[ $op -eq 1 ]]; then
		firstfunc
		elif [[ $op -eq 2 ]]; then
		secondfunc
		else
		thirdfunc
		fi
done
