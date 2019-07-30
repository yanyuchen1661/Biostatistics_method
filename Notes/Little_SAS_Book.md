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
