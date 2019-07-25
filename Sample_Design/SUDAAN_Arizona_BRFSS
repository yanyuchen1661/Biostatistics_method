/* SUDAAN in BIOS 550 class */

libname x 's:\course\bios550';

/* Read in data of Arizona BRFSS */
data work.az;
	set x.azbrfss;
run;

/*What does data look like*/
proc sql outobs=12;
   	title 'Data';
  	 select * 
      from az;
/*What does data types look like*/
proc contents data=az 
	noprint 
	out=data_info (keep = name type length);
run;

proc print data=data_info;
run;


proc sql ;
select
	AREACODE, 
	IDATE ,
	IDAY, 
	IMONTH ,
	INTVID ,
	IYEAR ,
	PHONENUM ,
	PREFIX ,
	STATEQUE ,
	SUFFIX ,
	WINDDOWN ,
	_RECORD 
from work.az;
quit;
/* Look at the chr variables IDAY, IMONTH ,IYEAR can be recoded to numeric */

/*let's convert them into numeric format
create macro list of the Numberic Data*/

proc sql ;

	 /* create macro list of the conversion from the original name to the new name with the suffix "C" */
     select cats(name,'C' ' = ' , name )
     into :origin
          separated by ' '
     from data_info
     where name in ('IDAY', 'IMONTH' ,'IYEAR') and type =2;
quit;

/*Use proc datasets statement to rename the variables with names which have "c"*/

proc datasets

library = work
          	nolist;
     		modify az;
     		rename &conversions;

quit;

/*or to convert it with a simple process to input in a different variable and then drop it*/
data work.new_az;

set work.az;

IDAY=input(IDAYC,2.);
drop IDAYC;

IMONTH=input(IMONTHC,2.);
drop IMONTHC;

IYEAR=input(IYEARC,2.);
drop IYEARC;

run;
/*Double check if the day month and year converted into numeric*/
proc SQL outobs=12;

select IDAY, IMONTH, IYEAR

from work.new_az;

run;

proc contents data=new_az noprint out=data_info2 (keep = name type length);

run;

proc print data=data_info2;

run;


/**************************************************************/

/**************************************************************/
/* Look at the content of this results, 
the BMI usually between 20-25, but the results are max of 999, 
the extreme value of toldhi and bphigh are 7 and 9, means unknown and missing value
so recoded */

proc univariate data=work.az;

var age _bmi toldhi bphigh SMOKE30 smokenow EXERANY POORHLTH menthlth;

run;


data az;
set new_az;
	if . lt _bmi lt 999 then bmi=_bmi/10;
	if age lt 18 then age=.;
	if toldhi in (7,9) then toldhi=.;
	if bphigh in (7,9) then bphigh=.;
	if firearms in (7,9) then firearms = .;
	if ammstorg in (7,9) then ammstorg = .;
	if hadproct eq 2 then hadproct2 = 0;
		else hadproct2 = hadproct;
	if hadproct2 in (7,9) then hadproct2 = .;
	if marital in (6,7,9) then marital = .;
	if educa in (7,9) then educa = .;
	if hadmam eq 2 then hadmam2 = 0;
		else hadmam2 = hadmam;
	if hadmam2 in (7,9) then hadmam2 = .;
run;

proc sort data=az;
	by _ststr _psu;
run;

/*1 The estimated mean number of days smoked in the past 30 days 
for people who smoke now, with SD*/
proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var smoke30;
	subpopn smoke30 <= 30 & smokenow=1;
	print mean semean ;
run;

/*2 The mean number of days smoked in the past 30 days for current smokers 
for those who report participating in any physical activity versus those who do not*/

proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var smoke30;
	subpopn smokenow=1;
	rby exerany;
	print mean semean;
run;

	/* Mean number of days smoked in the past 30 days for current smokers 
	for those who report participating in any physical activity
	EXERANY=1*/

proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var smoke30;
	subpopn smoke30 <= 30 & smokenow=1 & EXERANY=1; 
	print mean semean;
run;

	/* Mean number of days smoked in the past 30 days for current smokers 
	for those who report participating in any physical activity
	EXERANY=2*/

proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var smoke30 ;
	subpopn smoke30 <= 30 & smokenow=1 & EXERANY=2; 
	print mean semean;
run;

/* Compare two means using T test */
proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var smoke30;
	subpopn smoke30 <= 30 & smokenow=1;
	subgroup exerany;
	levels 2;
	contrast exerany=(-1,1);
	print t_mean p_mean;
run;

/* 3 Estimate the mean number of days in the past month that individuals reported poor
physical health, and an 88% confidence interval for that mean*/
proc descript data=az filetype=SAS design=wr conf_lim=88;
	nest _ststr _psu;
	weight _finalwt;
	var poorhlth;
	print mean semean lowmean upmean;
run;


/* 4 The number of days in the past month that individuals reported poor mental health
broken down by race groups, report means and sd for each group*/
proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var menthlth;
	subgroup _racegr;
	levels 4;
	table _racegr;
	print mean semean lowmean upmean;
run;



/* 5 Estimate the proportion of people in Arizona who have any kind of health insurance plan*/
proc descript data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	var hlthplan;
	catelevel 1;
	print percent sepercent/ style=nchs;
run;

/* 6 Estimate the proportion of people in Arizona who have any kind of health insurance plan 
by gender, report proportions, test statistic and p-value 
SEX=1, Percent=84.22
SEX=2, Percent=85.35
Chi-Square value=0.2295
	P-value=0.6321
	Therefore, there is no statistically different between 
sex group with respect to proportion of people in Arizona 
who have any kind of health insurance plan.
*/
proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup hlthplan sex;
	levels 2 2;
	tables sex*hlthplan;
	test chisq;
run;

/* 7 What is the total number of women in Arizona who have had a hysterectomy (HADHYST)?  
What proportion of the female population is this?

Total number is 1180
Weighted size is 1563371
Population proportion is 25.35
*/


proc CROSSTAB data=az filetype=SAS design=wr conf_lim=95;
	nest _ststr _psu;
	weight _finalwt;
	subgroup hadhyst;
	levels 2;
	print nsum wsum totper setot;
run;

/*************************************************************************************/
/*PROC CROSSTAB AND REGRESS*/
/*************************************************************************************/
proc freq data=az;
	tables firearms ammstorg;
run;

/*1.	What percent of those who keep firearms in their house (FIREARMS = 1) 
keep their ammunition locked (AMMSTORG = 1) vs. unlocked (AMMSTORG = 2)?
-----------------------------------------------------------------------------
|                 |                  | AMMUNITION LOCKED OR UNLOCKED        |
| LOADED OR       |                  |--------------------------------------|
| UNLOADED        |                  | Total      | 1          | 2          |
| FIREARMS        |                  |            |            |            |
-----------------------------------------------------------------------------
|                 |                  |            |            |            |
| Total           | Sample Size      |         87 |         13 |         74 |
|                 | Weighted Size    |  149530.77 |   21659.57 |  127871.20 |
|                 | SE Weighted      |   19653.57 |    6928.11 |   18214.51 |
|                 | Row Percent      |     100.00 |      14.49 |      85.51 |
|                 | SE Row Percent   |       0.00 |       4.30 |       4.30 |
|                 | Lower 95% Limit  |            |            |            |
|                 |  ROWPER          |        .   |       7.89 |      74.92 |
|                 | Upper 95% Limit  |            |            |            |
|                 |  ROWPER          |        .   |      25.08 |      92.11 |
|                 | Col Percent      |     100.00 |     100.00 |     100.00 |
|                 | SE Col Percent   |       0.00 |       0.00 |       0.00 |
|                 | Lower 95% Limit  |            |            |            |
|                 |  COLPER          |        .   |        .   |        .   |
|                 | Upper 95% Limit  |            |            |            |
|                 |  COLPER          |        .   |        .   |        .   |
|                 | Tot Percent      |     100.00 |      14.49 |      85.51 |
|                 | SE Tot Percent   |       0.00 |       4.30 |       4.30 |
|                 | Lower 95% Limit  |            |            |            |
|                 |  TOTPER          |        .   |       7.89 |      74.92 |
|                 | Upper 95% Limit  |            |            |            |
|                 |  TOTPER          |        .   |      25.08 |      92.11 |
-----------------------------------------------------------------------------
*/
proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup firearms ammstorg;
	levels 2 2;
	tables firearms*ammstorg;
run;

/*2.	a) 
What is the frequency distribution for proctoscopic exam (HADPROCT) versus marital status 
(MARITAL: 1 = married, 2 = divorced, 3 = widowed, 4 = separated, 5 = never married).  
In other words, create a table with marital status as the rows and 
proctoscopic exam (yes, no) as the columns; report row percent.  
Is marital status significantly associated with whether or not a man gets a proctoscopic exam?  
Report test statistic and associated p-value.

Marital status	Proctoscopic exam	Chisq Wald-F	P-value
	Yes (%)	No (%)		
  Married	31.91	68.09	2.997	0.0577
  Divorced	22.71	77.29		
  Widowed	42.98	57.02		
  Separated	35.93	64.07		
  Never married	26.20	73.80		

*/

proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup hadproct marital;
	levels 2 5;
	tables marital*hadproct;
	test chisq;
run;

/* 2 b)
Does this relationship change after controlling for education 
(EDUCA: 1 = no school/only kindergarten, 2 = elementary (grades 1-8), 
3 = some high school (grades 9-11), 4 = high school graduate or G.E.D., 
5 = some college (1-3 years), 6 = college or advanced degree (6+), 9 = refused).  
Use only values 1-6 (ignore the refused category) and 
report the appropriate test statistic and associated p-value.
Marital status	T statistic	P-value
  Married	0.71	0.4775
  Divorced	-0.36	0.7155
  Widowed	1.83	0.0681
  Separated	0.73	0.4632
  Never married	Ref	Ref
*/

proc rlogist data=az 
			 filetype=SAS design = wr;
   nest _ststr _psu;
   weight _finalwt;
   subgroup marital educa;
   levels   5  6;
   model hadproct2 = marital educa;
run;


/* 3.	a) 
Repeat your analysis from 2.a) for mammograms (HADMAM).  
Report row percents, test statistic, and p-value.

Marital status	Mammograms	Chisq Wald-F	P-value
	Yes (%)	No (%)		
  Married	64.46	35.54	15.1507	< 0.0001
  Divorced	68.18	31.82		
  Widowed	83.96	16.04		
  Separated	62.89	37.11		
  Never married	27.04	72.96		
*/

proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup hadmam marital;
	levels 2 5;
	tables marital*hadmam;
	test chisq;
run;


/* 3 b) Repeat your analysis from 2.b) for mammograms, controlling for education.  
Report only test statistic and p-value.
*/

proc rlogist data=az 
			 filetype=SAS design = wr;
   nest _ststr _psu;
   weight _finalwt;
   subgroup marital educa;
   levels   5  6;
   model hadmam2 = marital educa;
run;


/* 4 a) 
What percent of people use condoms (USECONDM: 1 = yes, 2 = no) 
for each level of chances of getting infected with HIV 
(GETHIV: 1 = high, 2 = medium, 3 = low, 4 = none)?  Report row percents.  
Is there a significant association between condom usage and estimation of chances of getting HIV?  
Report test statistic and associated p-value.
*/

proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup usecondm gethiv;
	levels 2 4;
	tables gethiv*usecondm;
	test chisq;
run;

/* 4 b) 
Does this relationship change after controlling for gender (SEX: 1 = male, 2 = female)?  
Report row percents for tables stratified by gender, test statistic, and p-value.
*/

proc crosstab data=az filetype=SAS design=wr;
	nest _ststr _psu;
	weight _finalwt;
	subgroup usecondm gethiv sex;
	levels 2 4 2;
	tables sex*gethiv*usecondm;
	test chisq;
run;

/* 5 
Fit a linear model predicting the number of days of negative mental health (MENTHLTH) 
given an individual’s age, gender, and education (use the same categories as above). 
Which variables are significantly associated with mental health?  Report Wald F statistics and p-values.  
*/
proc regress data=az
             filetype=SAS design=wr;
   nest _ststr _psu;
   weight _finalwt;
   subgroup sex educa;
   levels     2    6 ;
   model menthlth = age sex educa;
run;
