use at3857;


select * from at3857.dataset1;

select * from sa4764.dataset2;

select * from dataset3new;

--create table akanksha_naics  as (select substr(industrytitle,1,3) as industrycode,totalemp from dataset1 order by industrytitle ASC);
select * from akanksha_naics;
--create table sumit_naics  as (select substr(trim(industrytitle),1,2) as industrytitle ,totalwages from sa4764.dataset2  order by industrytitle ASC);

select * from sumit_naics;

--create table sumofwages as select trim(industrytitle) as industrytitle ,sum(totalwages) as TotalWages from sumit_naics group by industrytitle;

--create table sumofemp as Select trim( industrycode) as industrycode ,sum(totalemp) as TotalEmp from akanksha_naics group by industrycode;

select  sumofemp .industrycode as Naicscode ,  sumofemp.totalemp  as totalemp , sumofwages.totalwages as totalwages from sumofemp  join sumofwages  
On sumofemp .industrycode =sumofwages .industrytitle; 

/*
create table naicsemp as select  sumofemp .industrycode as Naicscode ,  sumofemp.totalemp  as totalemp , sumofwages .totalwages as totalwages from sumofemp  join sumofwages
On sumofemp .industrycode =sumofwages .industrytitle;
*/

Select * from naicsemp;

select  distinct naicsemp.totalwages , dataset3new.industry, dataset3new.cipcode, dataset3new.cipname from naicsemp join dataset3new on trim(dataset3new.code) = naicsemp.naicscode where  naicsemp.naicscode in  (select naicscode from naicsemp) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname , naicsemp.totalwages  desc;

/*
create table rankdegreebySal as select  dense_rank() over (partition by dataset3new.cipname order by naics.totalwages) as salrank,naics.totalwages as wages , dataset3new.industry as industry, dataset3new.cipname as degree from naics join dataset3new on substr(trim(dataset3new.code),1,2) = naics.naicscode where  naics.naicscode in  (select naicscode from naics) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname, naics.totalwages desc ;
*/

select * from rankdegreebysal;

/*
create table rankdegreebyemp as select  dense_rank() over (partition by dataset3new.cipname order by naicsemp.totalemp) as emprank ,naicsemp.totalemp as emp, dataset3new.industry as industry, dataset3new.cipname as degree from naicsemp join dataset3new on trim(dataset3new.code) = naicsemp.naicscode where  naicsemp.naicscode in  (select naicscode from naicsemp) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname, naicsemp.totalemp desc ;
*/

select * from rankdegreebyemp; 

/*
create NaicsJoin select industrycode,totalemp,totalwages from sumit join akanksha where trim(industrycode)=trim(industrytitle);
*/

select distinct * from NaicsJoin join dataset3new  on  trim(industrycode) = trim(code);


/*


Create table NYwages as select  dense_rank() over (partition by dataset3new.cipname order by naicsjoin.totalwages) as nyrank,totalwages as totalwages ,industry as industry, cipcode as cipcode, cipname as degree from naicsjoin join dataset3new on trim(dataset3new.code) = trim(industrycode) where  trim(industrycode) in  (select naicscode from naicsemp) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname , naicsjoin.totalwages  desc;

*/

select * from NYwages ;

/*

create table Degreetemp as SELECT degree, MAX(nyrank) as highestrank , max(nywages.totalwages) as highestwage
    FROM nywages
    GROUP BY degree ;
*/

select * from Degreetemp ;

select distinct degreetemp.degree, highestrank, industry from degreetemp join nywages on highestwage=totalwages;

--TOTAL employees
/*
Create table NYemp as select  dense_rank() over (partition by dataset3new.cipname order by naicsjoin.totalemp) as nyrank,totalemp as totalemp , dataset3new.industry as industry, dataset3new.cipcode as code, dataset3new.cipname as degree from naicsjoin join dataset3new on trim(dataset3new.code) = trim(industrycode) where  trim(industrycode) in  (select naicscode from naicsemp) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname , naicsjoin.totalemp  desc;
*/

select * from NYemp ;

/*
create table ranknytemp as SELECT degree, MAX(nyrank) as highestrank , max(nyemp.totalemp) as highestemp
    FROM nyemp
    GROUP BY degree;

*/

SELECT degree, MAX(nyrank) as highestrank , max(nyemp.totalemp) as highestemp
    FROM nyemp
    GROUP BY degree;



------Florida

--hdfs dfs -ls /user/at3857/projectFlorida/output
/*
create external table dataset1_florida(industrytitle string, totalemp int)
 row format delimited fields terminated by ','
 location '/user/at3857/ projectFlorida /output/'; 

*/

/*
create  table FloridaNaics as select trim(industrytitle) as industrycode , totalemp from dataset1_florida ;
*/

select * from FloridaNaics ;
/*
Create table Floridaemp as select  dense_rank() over (partition by dataset3new.cipname order by FloridaNaics.totalemp) as flrank,totalemp as totalemp , dataset3new.industry as industry, dataset3new.cipcode as code, dataset3new.cipname as degree from FloridaNaics join dataset3new on trim(dataset3new.code) = trim(industrycode) where  trim(industrycode) in  (select naicscode from naicsemp) and dataset3new.cipname in (select  distinct cipname from dataset3new) order by dataset3new.cipname , FloridaNaics.totalemp  desc;
*/

select * from Floridaemp ;

/*

create table rankfloridatemp as SELECT degree, MAX(flrank) as highestrank , max(floridaemp.totalemp) as highestemp
    FROM Floridaemp
    GROUP BY degree;
*/

select * from rankfloridatemp ;

--final employment analytics Florida

select distinct rankfloridatemp.degree, highestrank, industry from rankfloridatemp join Floridaemp on highestemp=totalemp;

--final employment analytics New York
select distinct ranknytemp.degree, highestrank, industry from ranknytemp join nyemp on highestemp=totalemp;

--final wages analytics New York

select distinct degreetemp.degree, highestrank, industry from degreetemp join nywages on highestwage=totalwages;