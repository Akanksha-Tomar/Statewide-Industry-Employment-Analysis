#!/usr/bin/env python
import sys
import csv
file = sys.stdin
# file = open('qcew_annual.csv',  newline='')
data = file.readlines()
# data = csv.reader(file)
data1 = csv.DictReader(data)
for row in data1:
     columnvalue=row.get('AREA')
     if columnvalue =="New York State":
        print 1, ":",row['AREA'],":",row['YEAR'],":" ,row['TOTWAGE'] ,":",row['TITLE']
