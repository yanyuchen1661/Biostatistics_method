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
   

### Write a simple report
- File '  ' print;
DATA _NULL_;
INFILE 'c:\MyRawData\Candy.dat';
INPUT Name $ 1-11 Class @15 DateReturned MMDDYY10.
CandyType $ Quantity;
Profit = Quantity * 1.25;
FILE 'c:\MyRawData\Student.rep' PRINT; TITLE;
   PUT @5 'Candy sales report for ' Name 'from classroom ' Class // @5 'Congratulations! You sold ' Quantity 'boxes of candy' / @5 'and earned ' Profit DOLLAR6.2 ' for our field trip.';
       PUT _PAGE_;
RUN;

Notice that the keyword _NULL_ appears in the DATA statement instead of a data set name. _NULL_ tells SAS not to bother writing a SAS data set (since the goal is to create a report not a data set), and makes the program run slightly faster. The FILE statement creates the output file for the report, and the PRINT option tells SAS to include carriage returns and page breaks. The null TITLE statement tells SAS to eliminate all automatic titles.
The first PUT statement in this program starts with a pointer, @5, telling SAS to go to column 5. Then it tells SAS to print the words Candy sales report for followed by the current value of the variable Name. The variables Name, Class, and Quantity are printed in list style whereas Profit is printed using formatted style and the DOLLAR6.2 format. A slash line pointer tells SAS to skip to the next line; two slashes skips two lines. You could use multiple PUT statements instead of slashes to skip lines because SAS goes to a new line every time there is a new PUT statement. The statement PUT _PAGE_ inserts a page break after each student’s report. When the program is run, the log will contain these notes:

### PROC MEANS 
- N AND NMISS
- STDDEV
- BY
  - Order first
- CLASS
  - [_TYPE_](https://support.sas.com/resources/papers/proceedings/proceedings/sugi27/p077-27.pdf)
- VAR

PROC MEANS DATA = zoo NOPRINT;
VAR Lions Tigers Bears;
OUTPUT OUT = zoosum MEAN(Lions Bears) = LionWeight BearWeight;
RUN;

The SAS data set created in the OUTPUT statement will contain all the variables defined in the output statistic list; any variables listed in a BY or CLASS statement; plus two new variables, _TYPE_ and _FREQ_. If there is no BY or CLASS statement, then the data set will have just one observation. If there is a BY statement, then the data set will have one observation for each level of the BY group. CLASS statements produce one observation for each level of interaction of the class variables. The value of the _TYPE_ variable depends on the level of interaction. The observation where _TYPE_ has a value of zero is the grand total.2

### PROC FREQ
TABLES Sex * YearsEducation / MISSING;
OPTIONS:
- LIST
- MISSING
- NOCOL
- NOROW
- OUT = data-set
prints cross-tabulations in list format rather than grid
includes missing values in frequency statistics
suppresses printing of column percentages in cross-tabulations 
suppresses printing of row percentages in cross-tabulations 
writes a data set containing frequencies

### PROC TABULATE
PROC TABULATE;
CLASS classification-variable-list;
TABLE page-dimension, row-dimension, column-dimension;

PROC TABULATE report with options;
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2; CLASS Locomotion Type;
VAR Price;
TABLE Locomotion ALL, MEAN*Price*(Type ALL)
/BOX='Full Day Excursions' MISSTEXT='none'; TITLE;
RUN;

DATA boats;
INFILE 'c:\MyRawData\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36; * Changing headers;
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2; CLASS Locomotion Type;
VAR Price;
PROC FORMAT;
VALUE $typ 'cat' = 'catamaran'
'sch' = 'schooner'
'yac' = 'yacht';
FORMAT Type $typ.;
 TABLE Locomotion   ALL,
MEAN=''*Price
/BOX='Full Day Excursions' MISSTEXT='none';
TITLE; RUN;

### PROC RRPORT
By default, PROC REPORT prints your data immediately beneath the column headers. To visually separate the headers and data, use the HEADLINE or HEADSKIP options like this:
PROC REPORT NOWINDOWS HEADLINE HEADSKIP;
HEADLINE draws a line under the column headers while HEADSKIP puts a blank line beneath the column headers.2

DATA natparks;
INFILE 'c:\MyRawData\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
TITLE 'Report with Character and Numeric Variables'; RUN;
 PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Museums Camping;
TITLE 'Report with Only Numeric Variables'; RUN;

- Group variables
PROC REPORT DATA = employees NOWINDOWS; COLUMN Department Salary Bonus; DEFINE Department / GROUP;

- Across variables
PROC REPORT DATA = employees NOWINDOWS; COLUMN Department , (Salary Bonus); DEFINE Department / ACROSS;

- Difference of GROUP AND ACROSS
DATA natparks;
INFILE 'c:\MyRawData\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
* Region and Type as GROUP variables;
 PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
 RUN;
COLUMN Region Type Museums Camping;
 DEFINE Region / GROUP;
  DEFINE Type / GROUP;
  TITLE 'Summary Report with Two Group Variables';
  * Region as GROUP and Type as ACROSS with sums;
 PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
 COLUMN Region
Type,(Museums Camping)
;
   DEFINE Region / GROUP;
  DEFINE Type / ACROSS;
  TITLE 'Summ
  
## ODS Output Diliver System
Some men see things as they are and say, ‘Why.’ I dream
ings that never werre and say,‘Why not.’ ROBERT F. KENNEDY
- Create HTML Output

ODS HTML BODY = 'body-filename.html' options;

- Creat PDF files
ODS PDF FILE = 'c:\MyPDFFiles\Marine.pdf'; DATA marine;
INFILE 'c:\MyRawData\Sealife.dat';
INPUT Name $ Family $ Length @@; PROC MEANS DATA = marine;
       CLASS Family;
TITLE 'Whales and Sharks'; PROC PRINT DATA = marine; RUN;
* Close the PDF file;

- Change titles and footnotes
  COLOR=
BCOLOR=
HEIGHT=
JUSTIFY=
FONT=
BOLD
ITALIC
specifies a color for the text
specifies a color for the background of the text specifies the height of the text
requests justification
specifies a font for the text
makes text bold
makes text italic
   ODS PDF CLOSE;
   
   
TITLE FONT=Courier 'Courier '
BOLD 'Bold ' BOLD ITALIC 'Bold and Italic';

## Modify and Combining SAS Data Sets
- Set
- Merge

 Max Flight
   Zip Fit Leather
   Zoom Airborne
   Light Step
   Max Step Woven
   Zip Sneak
   
   running 1930
walking 2250
running 4150
walking 1130
walking 2230
c-train 1190
Here is the program:

DATA shoes;
INFILE ’c:\MyRawData\Shoesales.dat’; INPUT Style $ 1-15 ExerciseType $ Sales;
PROC SORT DATA = shoes; BY ExerciseType;
* Summarize sales by ExerciseType and print; PROC MEANS NOPRINT DATA = shoes;
VAR Sales;
BY ExerciseType;
OUTPUT OUT = summarydata SUM(Sales) = Total;
PROC PRINT DATA = summarydata; TITLE ’Summary Data Set’;
* Merge totals with the original data set; DATA shoesummary;
MERGE shoes summarydata;
BY ExerciseType;
Percent = Sales / Total * 100;
PROC PRINT DATA = shoesummary;
BY ExerciseType;
ID ExerciseType;
VAR Style Sales Total Percent;
TITLE ’Sales Share by Type of Exercise’;
RUN;

- Making Several Observations from One Using the OUTPUT Statement
* Create data for variables x and y; DATA generate;
DO x = 1 TO 6; y = x ** 2;
OUTPUT; END;
PROC PRINT DATA = generate; TITLE 'Generated Data';
RUN;

- [Difference between @@ and @](https://www.quora.com/How-do-the-options-and-differ-in-the-infile-statement-in-SAS)

- Changing Observations to Variables Using PROC TRANSPOSE
