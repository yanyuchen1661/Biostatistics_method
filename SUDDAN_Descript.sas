/* Class note on April 4 */
/* Specify libname */
libmae x "H:\"

/* Read in data */
data work.az;
set x.azbrfss;
if
run;

/* See contents of the data */
proc contents data=work.az;
run;

/* Read in data */
proc univariate data=work.za;
var age _bmi;
run;
/* Look at the content of this results, the BMI usually between 20-25, but the results are max of 999, so recoded */

/* Sort the data by ststr and psu */
Proc sort data=work.az;
  by _ststr _psu;
run;

/* Freqencies */
proc freq data=work.az;
  tables toldhi bphigh;
run;
/* 7 means don't know and 9 means refuse to answer*/

/* Proc descript procedure */
Proc descript data=work.az filetype = SAS design=wr design=wr conf_lim=90;
  nest _ststr _psu;
  weight _finalwt;
  
  var age _bmi;
  
  print mean semean lowmean upmean / style= NCHS;

run;

/* Proc descript procedure to get geomeans*/

/* line size change to 100*/
options ls=100;

Proc descript data=work.az filetype = SAS design=wr design=wr conf_lim=90;
  nest _ststr _psu;
  weight _finalwt;
  
  var age _bmi;
  
  print nsum wsum mean semean segeomean lowmean upmean / style= NCHS;

run;

/* Proc descript procedure to get toldhi bphigh */

Proc descript data=work.az filetype = SAS design=wr design=wr;
  nest _ststr _psu;
  weight _finalwt;
  
  var toldhi bphigh;
  catlevel 1 1;
  
  print percent sepercent lowpct uppct / style= NCHS;

run;

/* Proc descript procedure to get toldhi bphigh */
Proc descript data=work.az filetype = SAS design=wr design=wr;
  nest _ststr _psu;
  weight _finalwt;
  
  var  toldhi bphigh;
  catlevel  1 1;
  
  print nsum wsum mean semea percent sepercent lowpct uppct / style = NCHS;

run;
/* Percent require catlevel statement, and mean cannot coexist with catlevel statement */


/* SUDAN is not a SAS procedure and therefore it does not show any ods trace if turn on SUDAN */


/* Another way to show the results, the same as SUDAAN*/
proc surveymeans data=work.az mean stderr clm alpha=0.1;
strata _ststr;
cluster _psu;
weight _finalwt;
var age_bmi;
run;

/* Proc descript procedure with subgroup without specifying TABLE*/
Proc descript data=work.az filetype = SAS design=wr design=wr;
  nest _ststr _psu;
  weight _finalwt;
  
  var  age _bmi;
  
  subgroup sex;
  levels 2;
  
  print mean semea lowmean upmean / style = BOX;
run;


/* Proc descript procedure with subgroup of sex and race with specifying TABLE*/
Proc descript data=work.az filetype = SAS design=wr design=wr;
  nest _ststr _psu;
  weight _finalwt;
  
  var  age _bmi;
  
  subgroup sex _racegr;
  levels 2 4         ;
  
  tables sex _racegr _racegr*sex;
  print mean semea lowmean upmean / style = BOX;
run;

/* Proc descript procedure with subgroup of sex=2 with specifying TABLE*/
Proc descript data=work.az filetype = SAS design=wr design=wr;
  nest _ststr _psu;
  weight _finalwt;
  
  var  age _bmi;
  
  subgroup _racegr;
  levels 4       ;
  
  subpopn sex=2;
  
  tables _racegr;
  
  print mean semea lowmean upmean / style = BOX;
  
run;


