
CODE

libname project "H:\506\project";
proc means data=project.perk;
	var diff age IOP;
run;
/*1*/
/*1a What refraction was obtained after surgery? var YR1REF */
data work.yyc1;
	set project.perk;
		diff= YR1REF-BASEREF;
		if -1 le YR1REF le 1 then good=1;else good=0;
run;
/*1b what change in refraction was induced*/

proc sort data= work.yyc1;
	by descending good;
run;
/*1c what percent of patients achived a good refractive outcome*/
proc freq data=work.yyc1;
	table good;
run;

/*2*/
data work.yyc2;
	set project.perk;
	diff= YR1REF-BASEREF;
run;
/*2a age and change  two continuous random variable*/
data work.yyc2a;
set work.yyc2;
	if age le 35 then age=0;
	else age=1;
run;
/*ttest in age and diffence*/
proc ttest data=work.yyc2a sides=2 alpha=0.05 h0=0; 
	class age;
   var diff; 
run; 
/*anova in age and diffence*/
data work.yyc2aa;
set work.yyc2;
	if age le 30 then age=0;
	else if age le 40 then age=1;
	else if age le 50 then age=2;
	else if age le 60 then age=3;
run;

ods graphics on; 
proc anova data = work.yyc2aa;
      class age;
      model diff=age;
	  means age /hovtest welch;
run;
ods graphics off;

/*2b gender one ordinal one continous*/
data work.yyc2b;
	set work.yyc2;
run;
/*ttest in gender and diffence*/
ods graphics on;
proc ttest data=work.yyc2b sides=2 alpha=0.05 h0=0; 
	class sex;
   var diff; 
run; 
ods graphics off;

/*2c  use of soft contact lens before surgery   one ordinal one continous*/
data work.yyc2c;
	set work.yyc2;
run;
ods graphics on;
proc ttest data=work.yyc2c sides=2 alpha=0.05 h0=0; 
	class HXSFTCON;
   var diff; 
run; 
ods graphics off;

/*2d  intraocular pressure 0 represent less or equal than 15*/
data work.yyc2da;
set work.yyc2;
	if IOP le 15 then IOP=0;
	else IOP=1;
run;
/*ttest in IOP and diffence*/
proc ttest data=work.yyc2da sides=2 alpha=0.05 h0=0; 
	class IOP;
   var diff; 
run; 
/*anova in IOP and diffence*/
data work.yyc2db;
set work.yyc2;
	if IOP le 13 	then IOP=1;
	else if IOP le 19 then IOP=2;
	else IOP=3;
run;

ods graphics on; 
proc anova data = work.yyc2db;
      class IOp;
      model diff=IOP;
	  means IOP /hovtest welch;
run;
ods graphics off;
/*2e  the diameter of the clear zone*/
data work.yyc2e1;
	set work.yyc2;
	if DCZ=3 then delete;
run;
data work.yyc2e2;
	set work.yyc2;
	if DCZ=3.5 then delete;
run;
data work.yyc2e3;
	set work.yyc2;
	if DCZ=4 then delete;
run;
ods graphics on;
proc ttest data=work.yyc2e1 sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
proc ttest data=work.yyc2e2 sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
proc ttest data=work.yyc2e3 sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
ods graphics off;

/*3*/
/*Are any of the patient characteristics related to whether or not 
the patients obtained a good refractive outcome (-1 to +1 diopters)*/

data work.yyc3;
	set work.yyc1;
	if -1 le YR1REF le 1 then YR1REF=1;else YR1REF=0;
run;


proc ttest data=work.yyc3 sides=2 alpha=0.05 h0=0; 
	class YR1REF;
   var sex; 
run; 

proc ttest data=work.yyc3 sides=2 alpha=0.05 h0=0; 
	class YR1REF;
   var HXSFTCON; 
run; 

proc ttest data=work.yyc3 sides=2 alpha=0.05 h0=0; 
	class YR1REF;
   var BASEREF; 
run; 
proc ttest data=work.yyc3 sides=2 alpha=0.05 h0=0; 
	class YR1REF;
   var IOP; 
run; 
proc ttest data=work.yyc3 sides=2 alpha=0.05 h0=0; 
	class YR1REF;
   var AGE; 
run; 


data work.yyc3a;
	set work.yyc3;
	if DCZ=3 then delete;
run;
data work.yyc3b;
	set work.yyc3;
	if DCZ=3.5 then delete;
run;
data work.yyc3c;
	set work.yyc3;
	if DCZ=4 then delete;
run;
ods graphics on;
proc ttest data=work.yyc3a sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
proc ttest data=work.yyc3b sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
proc ttest data=work.yyc3c sides=2 alpha=0.05 h0=0; 
	class DCZ;
   var diff; 
run; 
ods graphics off;
