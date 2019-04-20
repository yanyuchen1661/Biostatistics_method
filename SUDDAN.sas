libmae x "H:\"

data work.az;
set x.azbrfss;
run;

```
Proc descript data=work.az filetype = SAS design=wr conf_lim=90;
  nest _ststr _psu;
  weight _finalwt;
  var age _bmi;

subgroup _racegr;
levels

subpopx sex=2;

tables _racegr;

  print mean semean lowmean upmean / style= NCHS;
run;
```
/* SUDAN is not a SA procedure and therefore it does not show any ods trace if turn on SUDAN */

/*Table Statement in SAS*/
```
proc freq table

```
/* SAS always generate list in window
SUDAN alway known to generate lists

The html looks good */


```
proc univariate
```

```
proc surveymeans data=work.az mean stderr clm alpha=0.1;
strata _ststr;
cluster _psu;
weight _finalwt;
var age_bmi;
run;
```

```
proc 
```
Comparing Statictics

T-Test output

print statement with TABLES

Standardized estimates: not reflect the original

