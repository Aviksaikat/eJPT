#!/bin/bash

usage(){
    echo "Usage: $0 <filename>"
}

#: ${1?"Usage: $0 <filename>"}

if [ $# != 1 ];
	then
		usage
		exit -1
fi

cat $1 | grep for | cut -d ' ' -f5