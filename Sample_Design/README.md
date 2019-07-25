# Sample Design
## [SUDAAN Project for Arizona BRFSS] (\Sample_Design\SUDAAN_Arizona_BRFSS)
## Important concept
- **Target Population**: set of element we would like to measure
- **Sampling Frame**: enumerated list containing a proper subset of elements in the target population
- **Sample**: subset o elements from sampling frame
  - Ideally selected at random
  - Measurable probability selection
  - Representative of th samplin frame
- **Estimator**: 
  - Mean
  - Proportion
  - Total
    - Population total is measure of overall impact and magnitude of the population, which can not be achieved by the mean and proportions
    - Totals can convey the number of people affected or involved in a much more insightful way
  - Ratio
    - Complex than means and totals
    - Non-linear
    - Difficult for variance estimation
- **Sampling Error**
  - Due to uncertainty in measuement for sample
  - Variablity in the estimates is called sampling error
- **Finite Population**
  - Sampling fraction becomes important
    - Important
    - Large fraction indicates less uncertainty
    - Probability samples are samples which have measurable probabilities of selection
  - Sampling variance is affected
- **Probability Sampling**
  - Samples which have measurable probabities of selection
  - Each sample may have a different probability of selection
  - Non-probability Samples based on selection o individuals in a non-random way are called non-probability samples 
  - Weights are th inverse o th probability o selection
    - Constant weights
    - Adjuested weights
    - Weighted estimators
## Factors 
- Cost
- Time
- Feasibility
## Types
### Simple Ramdom Sample （SRS）
- Random Sample
  - Independence
  - Identical distribution
- EPSEM samples
  - Probability samples where each observation in the population has the same known probability of being selected into the sample (EPSEM stands for equal probability of selection method sampling)
  - Weights are same
  - Estimator is unchanged
- Unrestricted Random Samples
  - Selecting sample with replacement
  - Strength: No finite population correction factor, which can be used when the sample without replacement more than 5% of a finite population
  - Drawback: could hav elements in sample more than one time
  - Usually assume with replacement even if we select without replacement  
- SRS
  - Gold standard of sample design
  - Provide unbiased estimates
  - Usually representative (although bad samples are possible)
#### Selecting SRS
- Long way
  - Give each element a unique number
  - Using a random number table, generate a random number
  - If this randomly generated number matches an element's unique number, the element is selected
  - Repeat until sample size is achieved
- Random sort method
  - Randomly sort the frame
  - Select the first n elements in the frame
- Binomial method
  - Generate a random number between zero and one
  - Select all elements whose r.n. is less than the sampling fraction
### Stratification Random Sample (StRS)
- Stratification is an artificial grouping of elements in the population
  - Race
  - Gender
  - Geography
#### Selecting StRS
- Separate frame into separate strata
- SRS within each stratum
- Allocation of sample over strata is key
  - Proportional allocation
  - Optimal allocation
- Sampling weights may not be constant
#### Benefits of StRS
- Ideal condition, stratification will improve precision
- Naive analyses of stratified sample would be conservative
- Post-stratification can be used on non-stratified data to improve representativeness
### Cluster Samples
- Naturally occurring collections of element in the population
- easier to sample th clusters first, and measure individuals within the cluster
- Strength: cheaper when the cost of primary unit is larger
- Drawback: degrees of freedom are based on th primary sampling unit or cluster.
- Types of CLUSTER DESIGN
  - One-Stage
    - Select a clusters from a population of A clusters using
      - SRS
      - Probability Proportional to Size (PPS)
    - Measure all units from a cluster  
    - Constant for every sample if each cluster have same units, an if SRS to select clusters, this is an EPSEM sample
    - If B is not the same: random denominator makes our estimator a ratio estimator and variable weights.
  - Multi-Stage
    - Method:
      - Randomly select primary sample units;
      - Randomly select secondary sample units;
      - Randomly select study units by any methods
      - variablitity heavily depends on the primary units, not on the final sample size
    - Drawback:
      - Variance estimation
      - Non-constant weights rather than fixed sample size
      - Random sample size rather than fixed smapling faction
      - Estimator would be ratio estimators, need to analyze the data accounting for the design
      - SAS would not produce valid variance estimates
    - PPS Designs
      - Sampling PSU's with probabilities of selection proportional to their size
      - All
  - Systematic Samples

# SUDAAN (*Su*rvey *Da*ta *An*alysis)
## Introduction
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
- What

- Why?
  - Have huge data set with thousands of responses, covering a wide array of demographic and behavior types
  - Want to analyze a small subset of the data
- How?
  - Wrong answer: subset the data in a SAS data step, and pass only the interesting cases to SUDAAN for analysis.
  - Right answer: because SUDAAN uses Talyor Series for variance estimation, it needs whole sample although analysis does not need the whole sample.
  - SUBPOPN 18 <= age <= 60

### RBY
- RBY works like the BY statement in SAS

### output statement

### print statement 
- Could turning off system information
  - NODATE
  - NOTIME
  - NOHEAD
- STYLE = NCHS / BOX

### Output
- ASCII table

## Descript Procedure
### VAR statement
- Similar to PROC MEANS
- All must be numbers including categorical variables
- **Quirk**: SUDAAN handle zeroes as missing, so zero value must be recoded
### NEWVAR statement
- Create new variable in SUDDAN procedure without process data prior to running SUDAAN
- Only numeric variables can be creasted
### CATLEVEL statement
- In var statement, if specifying a categorical variable, we need to identify which level is the "success".
### SUBGROUP statement
- Be aware of the **quick**
### TABLES statement
- Use the TABLES statement to get means or percentages for each subgroup
#### CONTRAST statement
- Need the vector
#### DIFFVAR statement
- Not useful for 
#### PAIRWISE statement

## CROSSTAB Procedure
- Generate univariate frequency distributions
- Look at percentages and standard errors by
  - overall
  - row
  - column
- Estimate Chi-Square statistics
- Compute Odds and Risk Ratios
### TEST statement
- **CHISQ**: Chi-Squared test, association based on the Pearson Chi-Squared Statistic
  - Uses observed and expected cell counts
  - Under null hypothesis of independence
  - Under assumption of fixed marginal counts
  - Degrees of freedom: (number of rows-1)\* (number of colnums-1)
  - SUDAAN uses Taylor Series to expand the test statistic and uses an approximation
- **LLCCHISQ**: log-likelihood Chi-Squared test, association based on log-linear model
- **CMH**:Cochran-Mantel-Hanszel

## Table in SUDAAN
### Simple Frequency Table
- NSUM
- WSUM
- Percentage
  - ROWPER / SEROW
  - COLPER / SECOL
  - TOTPER / SETOT

### RISK statement

### BDTEST statement
### AGREE statement


## Balanced Repeated Replication (BRR)
- deletes one PSU from each stratum
- doubles the other PSU
- require a design with two PSU's per stratum
## Jackknife Repeated Replication (JRR)
- delete one PSU
- Weight the others up

# REPLICATION
- Estimate the statistic
- Repeat over the set of PSU's
- JK1 

### Software for replication
- free veriosn is very clunky
- ugly
- SAS version 6
- no software runs well for basic stats




