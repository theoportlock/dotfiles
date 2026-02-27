#!/bin/bash
dir1=$1
dir2=$2
for files in $(diff -rq $dir1 $dir2|grep 'differ$'|sed "s/^Files //g;s/ differ$//g;s/ and /:/g"); do
	vimdiff ${files%:*} ${files#*:};
done
