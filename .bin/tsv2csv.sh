#!/bin/bash
nam=$(echo $1 | cut -f 1 -d  '.')
sed 's/\t/,/g' $1 > ${nam}.csv
