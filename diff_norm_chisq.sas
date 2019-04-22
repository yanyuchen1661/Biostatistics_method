/* show chisquare*/
data work.a;
  do i=1 to 1000;
     Z1=rannor(8675309);
     Z2=rannor(8675309);
     Z3=rannor(8675309);
     chisq=Z1*Z1 + Z2*Z2 +Z3*Z3;
     output;
  end;
proc univariate data=work.a;
  var z;
  histogram z;
run;

/*  chi-squared value is sum of squared error or sample variances. looks at the association under assumption that two dataset are indenpend.*/

data work.b;
  input a b count;
  1 1 10
  1 2 15
  2 1 5
  2 2 20
  ;
run;

proc freq data=work.b;
  tables a*b / cmh chisq;
  weight count;
run;

/* Mutiply  the sample size by 10 */
data work.b;
  input a b count;
  1 1 10
  1 2 15
  2 1 5
  2 2 20
  ;
run;

proc freq data=work.b;
  tables a*b / cmh chisq;
  weight count;
run;
