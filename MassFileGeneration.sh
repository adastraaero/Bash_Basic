#!/bin/bash
#counter with mass file generation
#first arg number of files, second directory for files
dd if=/dev/zero of=/inputfile bs=1024 count=10

cd /$2

for (( counter=1; counter<$1; counter++ )); do
	cp /inputfile $counter.blah
done
exit 0

