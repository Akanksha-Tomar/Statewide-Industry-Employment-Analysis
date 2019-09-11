#!/usr/bin/env python
import sys
city =[]
year =[]
wages =[]
# file = sys.stdin
for line in sys.stdin:
	newcolumns = line.split(":")
	city.append(newcolumns[0])
	year.append(newcolumns[2])
	wages.append(newcolumns[3])
numberoftotalrows = len(city)
print "total new york columns:", numberoftotalrows
result = dict((i, year.count(i)) for i in year)
#result = dict((i, sum(int(wages))) for i in year)
for key,value in result.items():
       print key, value
