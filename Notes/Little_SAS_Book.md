## Introduction to SAS
### Gramma
- semicolon
- period
- comma
### Dataset
- Data Types
  - Numeric
  - Character
    - Any variables who contain letters or special character
    - Can be 32,367 characters long
- Name rules
  - Name length should be less than or equal to 32 characters
  - Must start with a letter or underscore
  - No %$!*&#@
### Data and Proc Steps
  - Data steps
    - Read and modify data
    - Create a SAS data set
    - Data steps execute line by line and observation by observation
  - Perform specific analysis
    - produce result or report
### Windows for SAS Programs
- Editor
- Log
- Output
- Results
- Explorer
### Viewing Results
- CENTER | NOCENTER
- DATE | NODATE
- LINESIZE
- NUMBER | NONUMBER
- ORIENTATION = PORTRAIT | LANDSCAPE
- PAGENO | PAGESIZE
- RIGHTMARGIN | LEFTMARGIN | TOPMARGIN | BOTTOMMARGIN = N
- YEARCUTOFF = yyyy

## Getting data into SAS
- DATALINES | CARDS
- Windows: UNIX: OpenVMS: OS/390 or z/OS:
  - INFILE ’c:\MyDir\President.dat’;
  - INFILE ’/home/mydir/president.dat’;
  - INFILE ’[username.mydir]president.dat’;
  - INFILE ’MYID.PRESIDEN.DAT’;
- INPUT President $ Party $ Number;
- If want to input character variable, add a $ after this variable
- INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.
(Score1 Score2 Score3 Score4 Score5) (4.1);
- INPUT ParkName $ 1-22 State $ Year Acreage COMMA9.;
- INPUT ParkName $ 1-22 State $ Year @40 Acreage COMMA9.;
- Statements
INPUT @’Breed:’ DogBreed $; 
INPUT @’Breed:’ DogBreed $20.; 
INPUT @’Breed:’ DogBreed :$20.;
Value of variable DogBreed
Rottweil
Rottweiler Vet Bill Rottweiler
### Reading multiple lines of DATA per observation

          Nome AK
          55 44
          88 29
          Miami FL
          90 75
          97 65
          Raleigh NC
          88 68
          105 50
          * Create a SAS data set named highlow;
* Read the data file using line pointers; DATA highlow;
- using slash / or #N

INPUT City $ State $
/ NormalHigh NormalLow
#3 RecordHigh RecordLow; PROC PRINT DATA = highlow;

### Reading observations 
- use an @@ to stop it

Nome AK 2.5 15 Miami FL 6.75 18 Raleigh NC . 12
* Input more than one observation from each record; DATA rainfall;
INPUT City $ State $ NormalRain MeanDaysRain @@; PROC PRINT DATA = rainfall;

### Reading part of the raw data
- the trailing @ hold each lie of data
freeway 408
surface Martin Luther King Jr. Blvd. surface Broadway
surface Rodeo Dr.
freeway 608
freeway 808
surface Lake Shore Dr.
surface Pennsylvania Ave.
3684 3459
1590 1234
1259 1290
1890 2067
4583 3860
2386 2518
1590 1234
1259 1290

* Use a trailing @, then delete surface streets; DATA freeways;
INPUT Type $ @;
IF Type = ’surface’ THEN DELETE;
INPUT Name $ 9-38 AMTraffic PMTraffic;

### Controlling Input with Options in the INFILE Statement
- FIRSTOBS = N
- OBS = N
- MISSOVER
- TURNOVER
### Reading Delimited Files with the DATA Step
- DLM Option
  - Delimiter
  DLM = ’,’
  RUN;
  - Tab
  DLM = ’09’X
- DSD (Delimeter sensitive)
  - CSV
  
Lupine Lights,12/3/2003,45,63,70,
Awesome Octaves,12/15/2003,17,28,44,12
"Stop, Drop, and Rock-N-Roll",1/5/2004,34,62,77,91 The Silveyville Jazz Quartet,1/18/2004,38,30,42,43 Catalina Converts,1/31/2004,56,,65,34

Notice that one group’s name has embedded commas, and is enclosed in quotation marks. Also, the last group has a missing data point for the 9 p.m. hour as indicated by two consecutive commas. Use the DSD option in the INFILE statement to read this data file. It is also prudent, when using the DSD option, to add the MISSOVER option if there is any chance that you have missing data at the end of your data lines (as in the first line of this data file). The MISSOVER option tells SAS that if it runs out of data, don’t go to the next data line to continue reading. Here is the program that will read this data file:

INFILE ’c:\MyRawData\Bands.csv’ DLM = ’,’ DSD MISSOVER;
INPUT BandName :$30. GigDate :MMDDYY10. EightPM NinePM TenPM ElevenPM;
- GETNAMES = NO
### Using Permanent SAS Data Sets by Direct Referencing
Windows: UNIX: OpenVMS: OS/390 or z/OS:
DATA ’drive:\directory\filename’; DATA ’/home/path/filename’;
DATA ’[userid.directory]filename’; DATA ’data-set-name’;

## Functions
### Basic Functions
- Numeric
  - MEAN
  - ROUND
  - SUM
- Character
  - TRIM
  - TRANSLATE
  - UPCASE
- DATE
  - DAY
  - MDY
  - MONTH
  - QTR
  - TODAY
  ### IF statements
  - EQ: equals
  - NE: not equals
  - GT: greater than
  - LT: less than
  - GE: greater than or equal
  - LE: less than or equal 
- if and do 
IF condition THEN DO; action;
- if and else if
IF condition THEN action;
ELSE IF condition THEN action; ELSE IF condition THEN action;
action; END;
- The following two statements are equivalent (assuming there are only two values for the variable Sex, and no missing data):
  - IF Sex = 'f';
  -  IF Sex = 'm' THEN DELETE;

### SAS Dates
OPTIONS YEARCUTOFF = 1950;

### Retain and sum
RETAIN MaxRuns;
MaxRuns = MAX(MaxRuns, Runs);
RunsToDate + Runs;

### Arrays
- ARRAY song (10) domk wj hwow simbh kt aomm libm tr filp ttr;
DO i = 1 TO 10;
IF song(i) = 9 THEN song(i) = .; END;

### Shortcuts for List of Variable Names
- Input Cat8 - Cat12

- if and do 
- Positon function can list the variables in the proc contens process

## Print
- title
- footnoot
- label
### where statement
### contents by
### sorting data with proc sort
- NODUPKEY can delete same obs
- add descending before the variable
### Proc print
- By
- ID
- SUM
- VAR
### PROC PRINT
- FORMAT DateReturned DATE9. Profit DOLLAR6.2;
- FORMAT
  - FORMAT Sex gender. Age agegroup. Color $col. Income DOLLAR8.;
PROC FORMAT;
VALUE gender 1 = 'Male'
2 = 'Female';
VALUE agegroup 13 -< 20 = 'Teen'
                      20 -< 65 = 'Adult'
65 - HIGH = 'Senior'; VALUE $col 'W' = 'Moon White'
'B' = 'Sky Blue'
'Y' = 'Sunburst Yellow' 'G' = 'Rain Cloud Gray';

### Write a simple code
* Write a report with FILE and PUT statements; DATA _NULL_;
INFILE 'c:\MyRawData\Candy.dat';
INPUT Name $ 1-11 Class @15 DateReturned MMDDYY10.
CandyType $ Quantity;
Profit = Quantity * 1.25;
FILE 'c:\MyRawData\Student.rep' PRINT; TITLE;
PUT @5 'Candy sales report for ' Name 'from classroom ' Class // @5 'Congratulations! You sold ' Quantity 'boxes of candy' / @5 'and earned ' Profit DOLLAR6.2 ' for our field trip.';
       PUT _PAGE_;
   RUN;
