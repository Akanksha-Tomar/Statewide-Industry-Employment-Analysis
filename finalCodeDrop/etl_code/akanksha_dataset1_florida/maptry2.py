import sys
import csv

data = sys.stdin.readlines()
data1 = csv.DictReader(data)
for row in data1:
     columnvalue=row.get('area_title')
     if columnvalue =="Florida":
        print 1, ":",row['area_title'],":",row['naics_title'],":",row['naics'],":" ,row['tot_emp']
