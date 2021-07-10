#!/bin/bash


: ${1?"Usage: $0 <hostname> <custom_port> or <port_in_bb>"}

nmap $1 -v -Pn -n -p$(cat $2) -oN ine_custom_port_scan --open
