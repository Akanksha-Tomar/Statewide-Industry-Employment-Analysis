# Statewide-Industry-Employment-Analysis
The study examines the correlation between the field of education and job location of a student. Each state has a dominant sector, which usually absorbs a large chunk of the working population, making it easier to find jobs in that sector. The likelihood of being employed in a sector is chiefly dependent upon the location of the job. If an individual desires to work in a particular sector, then moving to the state where that sector is a dominant employer will increase his/her chances of landing a job in the sector of his/her choice. Employment in a partic-ular sector does not necessarily mean the same type of job, but working in diverse business areas, propelling the growth of that sector
Keywords: naics, cip, degree, industry, wages, students, total employment.

# Steps to run it in hadoop environment 
1) To run Mapper and reducer of all three datasets please find the directories in dataingest folder

2) We have two states analysis for dataset 1

for running the new york state please use mapper reducer of the below folders:
finalCodeDrop\etl_code\akanksha_dataset1_newyork
finalCodeDrop\etl_code\dataset2
finalCodeDrop\etl_code\Newdataset3

for running the florida state please use mapper reducer of the below folders:
finalCodeDrop\etl_code\akanksha_dataset1_florida
finalCodeDrop\etl_code\Newdataset3

3) Final analytics script path and command found in folder finalCodeDrop\sourceCodeAnalytics:

impala-shell -i  compute-2-2 -f ##########/finalanalyticcode.sql;

4) All analytics code is in database ######

impala-shell -i  compute-2-2 -d at3857 -f ###########/finalanalyticcode.sql;

5) The results of the run will be in tables as mentioned in finalanalytics code in database at3857 in impala
--final employment analytics Florida

select distinct rankfloridatemp.degree, highestrank, industry from rankfloridatemp join Floridaemp on highestemp=totalemp;

--final employment analytics New York
select distinct ranknytemp.degree, highestrank, industry from ranknytemp join nyemp on highestemp=totalemp;

--final wages analytics New York

select distinct degreetemp.degree, highestrank, industry from degreetemp join nywages on highestwage=totalwages;
