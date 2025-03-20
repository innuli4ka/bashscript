#!/bin/bash
function firstfunc() {
for line in $(cat $path); do
	echo "$line"
done
}

function secondfunc(){
echo "number of words:" $(wc -w "$path" | awk '{print $1}')
echo "number of lines:" $(wc -l "$path" | awk '{print $1}')
echo "size of file:" $(wc -c "$path" | awk '{print $1}')
if [[ "$1" != "" ]]; then
	if grep -q "$term" $path;then
		awk -v termToSearch="$term" '
		{
		for ( i = 1; 1 <= NF; i++) {
			count++
			if ($i == termToSearch) {
				print "true, word num:", count
			}
		}
		}
		' "$path"
	fi
fi
}

while true; do
echo "enter path of file"
read path
if [[ ! -e "$path" ]]; then
	echo "bad path, try again"
	continue
else
	break
fi
done
firstfunc
echo "enter term to search"
read term
secondfunc $term
echo "no more functions"
	
