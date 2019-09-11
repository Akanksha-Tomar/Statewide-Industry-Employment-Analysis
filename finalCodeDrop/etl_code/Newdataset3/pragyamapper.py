import sys
import csv

info = sys.stdin.readlines()
info1 = csv.DictReader(info)
for row in info1:
     column=row.get('YEAR')
     if column =="2016":
        print 1, "|",row['YEAR'],"|",row['Naics'],"|" ,row['Cip_name'],"|",row['Cip_code'],"|",row['Num_ppl'],"|",row['Avg_wage']

