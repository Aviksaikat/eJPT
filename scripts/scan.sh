#!/bin/bash
# this script will run a nmap scan on the hosts form the `hosts` file

: ${1?"Usage: $0 <hosts>"}

cat $1 | while read line; 
			do
				mkdir "$line";
				nmap -sC -sV -A -T4 -v -Pn -n -oN scan/"$line" $line; 
				cp scan/"$line" $line/scan
			done