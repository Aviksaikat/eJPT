# eJPT 

> Saikat Karmakar | 2021

---

### This repository contains scripts & notes I uesd duing the eJPT-PTS exam

## Scripts

- <u>port_gen.py</u>
    this program will take a port from the ports list & 
    add a combination of new ports to the custom_ports file

    eg. 
    21 -> 1021, 645021 etc.

    This doesn't make much sense but I'll say it'll be a lot
    more faster than the all-ports nmap scan

    The reason behind this program is that I've seen some 
    ports like 5080, 5122 etc. on the black-box labs & they
    were running web-server(default 80) & ssh(default 22).
    If you understand what i mean ;-)   
```py
#!/usr/bin/python3

#* top ports + ports found in the BB labs
ports = [21, 22, 23, 25, 53, 80, 110, 111, 135, 139, 143, 443, 445, 993, 995, 1433, 1723, 2222, 3306, 3389, 5900, 6379, 8080, 13306, 40121, 40180, 59919, 63306]

#* copying the ports in the `ports` list 
l = ports[:]

for i in range(1, 65535):
	i = str(i)
	for j in range(len(ports)):
		p = i + str(ports[j])
		if(int(p) < 65535):
			l.append(int(p))

#* remove duplicate
l = list(set(l))

l.sort()
#print(l)
for i in l:
	with open("custom_ports", 'a') as f:
		if i == 65525:
			f.write(str(i))
		else:
			f.write(str(i) + ',')
```
- <ins>get_hosts.sh
```bash

#!/bin/bash
fping -a -g -n 10.85.174.0/24 2>/dev/null > hosts
```

- <ins>scan.sh</ins>
this program will make a directory in the name 
of the hose(ip) & do a namp scan & save the 
scan results to their respective directories
```bash

#!/bin/bash
# this script will run a nmap scan on the hosts form the `hosts` file

: ${1?"Usage: $0 <hosts>"}

cat $1 | while read line; 
			do
				mkdir "$line";
				nmap -sC -sV -A -T4 -v -Pn -n -oN scan/"$line" $line; 
				cp scan/"$line" $line/scan
			done
```

- <ins>get_ports_from_scan.sh</ins>
this script will grep the ports found in nmap scan
```bash

#!/bin/bash

: ${1?"Usage: $0 <filename>"}

cat $1 | grep "^[0-9]." | cut -d '/' -f1 | tr '\n' ',' | sed 's/..$//' > ports_form_nmap_custom_scan
```
- <ins>get_hosts_from_scan.sh</ins>
this script will grep the hosts found in nmap scan

```bash

#!/bin/bash

usage(){
    echo "Usage: $0 <filename>"
}

if [ $# != 1 ];
	then
		usage
		exit -1
fi

cat $1 | grep for | cut -d ' ' -f5
```

- <ins>custom_port_scan.sh</ins>
this script was made to run with custom_ports file 
generated by `ports_gen.py`
```bash

#!/bin/bash

: ${1?"Usage: $0 <hostname> <custom_port> or <port_in_bb>"}

nmap $1 -v -Pn -n -p$(cat $2) -oN ine_custom_port_scan --open
```


## Notes 
- This folder contains eJPT syllabus, exam manual some notes
  I put together from the course material & some I found 
  useful on github. Thanks to the authors. In the [Penetration-Testing-Basics.pdf](notes/Penetration-Testing-Basics.pdf) I tried to put 
  my notes & others in one place. :-)