/* Mean, standard deviation, Min and Max */
proc means;
var x;
run;

/* Correlation : Pearson correlation coefficient */
proc corr;
var x y;
run;

