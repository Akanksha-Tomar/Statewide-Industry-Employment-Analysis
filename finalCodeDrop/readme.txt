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

impala-shell -i  compute-2-2 -f /home/at3857/finalanalyticcode.sql;

4) All analytics code is in database at3857 

impala-shell -i  compute-2-2 -d at3857 -f /home/at3857/finalanalyticcode.sql;

5) The results of the run will be in tables as mentioned in finalanalytics code in database at3857 in impala
--final employment analytics Florida

select distinct rankfloridatemp.degree, highestrank, industry from rankfloridatemp join Floridaemp on highestemp=totalemp;

--final employment analytics New York
select distinct ranknytemp.degree, highestrank, industry from ranknytemp join nyemp on highestemp=totalemp;

--final wages analytics New York

select distinct degreetemp.degree, highestrank, industry from degreetemp join nywages on highestwage=totalwages;

NOTE:Please let us know incase more instructions  or screenshots should be added for rebuilding we have added all the steps we could think of.