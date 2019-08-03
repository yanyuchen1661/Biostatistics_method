## Macro Concepts
- Macros 
- Macro variables
  - Local
  - Global
- Before use macros you must have the MACRO system option turned on
```sas
PROC OPTIONS OPTION = MACRO; RUN;
```
## Substituting Text with Macro Variables
- %LET
```sas
%LET iterations = 10;
%LET country = New Zealand;
DO i = 1 to &iterations;
TITLE ”Addresses in &country”;
```
After being resolved by the macro processor, these statements would become
```sas
DO i = 1 to 10;
TITLE ”Addresses in New Zealand”;
```


