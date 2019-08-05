PROC SQL;
SELECT
FROM
 WHERE
GROUP BY
ORDER BY

add quit:
```sas
proc sql;
                       select empid,jobcode,salary,
                              salary*.06 as bonus
                          from sasuser.payrollmaster
                          where salary<32000
                          order by jobcode;
quit;
```
