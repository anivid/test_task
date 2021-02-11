#!/bin/bash
function convert_func()
{
	#line = $1
	convert $1 -resize 320x `echo $1 | awk -F "." '{print $1 "_thumbnail" "." $2}'`
}


if [ $1 ]
then
	cat $1 | while read line
	do
		if [[ $line == *".jpg" ]]
		then
			convert_func $line
		fi
	done;
else
	find . -iname '*.jpg' | awk -F "/" '{print $2}' | while read line
	do
		
		if [[ $line != *"_thumbnail"* && $line == *".jpg" ]]
		then
			echo $line
			convert_func $line
		fi
	done
fi
