import sys
city =[]
jobtitles =[]
groupedjobtitles=[]
totalemployee =[]

for line in sys.stdin:
       newcolumns = line.split(':')

       city.append(newcolumns[0])
       jobtitles.append(newcolumns[3])
       totalemployee.append(newcolumns[4])
numberoftotalrows = len(city)
#print "total new york columns:", numberoftotalrows
#print totalemployee.items().strip()
result = dict((i, jobtitles.count(i)) for i in jobtitles)
for key,value in result.items():
       #print key, value
       groupedjobtitles.append(key)
#print groupedjobtitles
for nameofjob in groupedjobtitles:
       value=[]
       for index in range(0,len(jobtitles)-1):
           if jobtitles[index] == nameofjob:
                 numberofemployees=totalemployee[index].strip('\n')
                 numberofemployees= numberofemployees.replace(',','')
                 numberofemployees= numberofemployees.replace('**','0')
                 value.append(int(numberofemployees))

       print nameofjob,",",sum(value)
