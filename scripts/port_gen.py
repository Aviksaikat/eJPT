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