
```
Proc descript data=work.az filetype = SAS design=wr conf_lim=90;
  nest _ststr _psu;
  weight _finalwt;
  var age _bmi;

  print mean semean lowmean upmean / style= NCHS;
run;
```
- SUDAN is not a SA procedure and therefore it does not show any ods trace if turn on SUDAN 

```
proc freq
```
SAS always generate list in window
SUDAN alway known to generate lists

The html looks good 

proc univariate

```
proc surveymeans data=work.az mean stderr clm alpha=0.1;
strata _ststr;
cluster _psu;
weight _finalwt;
var age_bmi;
run;
```
