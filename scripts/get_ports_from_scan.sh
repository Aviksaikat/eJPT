#!/bin/bash

: ${1?"Usage: $0 <filename>"}

cat $1 | grep "^[0-9]." | cut -d '/' -f1 | tr '\n' ',' | sed 's/..$//' > ports_form_nmap_custom_scan
