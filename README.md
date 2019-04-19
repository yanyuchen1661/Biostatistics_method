## SUDAAN (*Su*rvey *Da*ta *An*alysis)
### Introduction
- Useful for the analysis of clustered and correlated data
- SAS-callable
### PROC Options
- Data = \<*data set name*\>
  - Specify the library name
  - Specify the data name, 
    - Can be temporary or permanent
    - Variable names should less than 8 letters
  - move to another system, do not have error
- FILETYPE = SAS
  - Tells SUDAAN what type of data file used
- Design = \<*sample design type*\>
  - Identifies the rough sample design
    - Random Sample With Replacement (WR)
    - Random Sample Without Replacement (WOR)
    - Multi-Stage PPS Design (UNEQWOR)
    - Stratified With Replacement (STRWR)
    - Stratified Without Replacement (STRWOR)
    - JACKKNIFE
    - BRR
  - Design Effects (DEFF)
    - Defination: A ratio of variance estimated based on the complex desgin, compared to the SRS design of the same size called the Design Effect
    - DEFF > 1 means loss of efficiency
- WEIGHT statement
- NEST statement
  - Data must be sorted in the same order as variables listed on this statement
  - Data must be sorted in ascending order
  - By default, considers the first variable listed as the stratification variable
    - What if we have more than one variables? Merger these variables into one variable
  - Subsequent variables in the list indicate clustering
### SUBPOPN
- Why?
  - Have huge data set with thousands of responses, covering a wide array of demographic and behavior types
  - Want to analyze a small subset of the data
- How?
  - Wrong answer: subset the data in a SAS data step, and pass only the interesting cases to SUDAAN for analysis because SUDAAN uses Talyor Series for variance estimation, it needs whole sample although analysis does not need the whole sample.
$
    f(x) = e^x
    f(x) = f(a) + f'(a)(x-a)/1! + f''(a)(x-a)^2/2!
    e^x = e^a + e^a (x-a)/1! + e^a (x-a)/2!
$
