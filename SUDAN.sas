
```
Proc descript data=work.az filetype = SAS design=wr conf_lim=90;
  nest _ststr _psu;
  weight _finalwt;
  var age _bmi;

  print mean semean lowmean upmean / style= NCHS;
run;
```
