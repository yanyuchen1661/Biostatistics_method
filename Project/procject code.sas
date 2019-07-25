libname x "H:"
data one;
set x.one;
input
id    race     wtkg    gluc    hba1c;
run;
proc ANOVA data=one;
	title 'one-way ANOVA test for the mean HbA1c(%) of four race groups' ;
	class race;
	model hba1c = race;
	means race /hovtest welch;
	run;
/*number in each cell is not the same use scheffe method*/
proc glm;
class race;
model hba1c = race;
means race / cldiff scheffe;
estimate 'white and Hispanic patients compared with blacks and Asians' race 1 -1 1 -1;
run;

data two;
set one;
wtkghba1c=wtkg*hba1c;
sq_wtkg=wtkg*wtkg;
sq_hba1c=hba1c*hba1c;
run;
proc sort data=two;
by race;
run;
proc reg;
model gluc= wtkg hba1c wtkghba1c sq_wtkg sq_hba1c/
selection= backward slentry=0.10;
title 'Forward selection to determine the overall regreesions';
run;


proc reg;
model gluc= sq_wtkg hba1c;
title 'Overall regreesions ';
run;

proc reg;
by race;
model gluc= sq_wtkg hba1c;
title 'Overall regreesions ';
run;

proc glm data=two order=internal;
class race;
model gluc= sq_wtkg race|hba1c / solution;
store three;
run;

proc glm data=two order=internal;
class race;
model gluc= race|sq_wtkg hba1c / solution;
store four;
run;

proc glm data=two;
class race;
model gluc= race|sq_wtkg  race|hba1c / solution;
store five;
run;

proc plm restore = three;
estimate 'hba1c slope, race=1 white' hba1c 1 hba1c*race  1 0 0 0,
         'hba1c slope, race=2 black' hba1c 1 hba1c*race 0 1 0 0,
		 'hba1c slope, race=3 Hispanic' hba1c 1 hba1c*race  0 0 1 0,
         'hba1c slope, race=3 Asian' hba1c 1 hba1c*race  0 0 0 1/ e;
run;

proc plm restore = four;
estimate 'sq_wtkg slope, race=1 white' sq_wtkg 1 sq_wtkg*race  1 0 0 0,
         'sq_wtkg slope, race=2 black' sq_wtkg 1 sq_wtkg*race 0 1 0 0,
		 'sq_wtkg slope, race=3 Hispanic' sq_wtkg 1 sq_wtkg*race  0 0 1 0,
         'sq_wtkg slope, race=3 Asian' sq_wtkg 1 sq_wtkg*race  0 0 0 1/ e;
run;


