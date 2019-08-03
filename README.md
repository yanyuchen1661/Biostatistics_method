# SAS code
## Project
### [Myopia project](/Project/myopia.sas)
### [Type 2 Diabetes projects](/Project/Type2D.sas)
## Sample Design
### [SUDAAN Project for Arizona BRFSS](/Sample_Design/SUDAAN_Arizona_BRFSS.sas)
## Macro
### [Dice game](/macro/Dice.sas)

## Common SAS code in statistical analysis
### Examining the Distribution of Data with PROC UNIVARIATE
```sas
PROC UNIVARIATE PLOT NORMAL;
VAR variable-list;
```
### Producing Statistics with PROC MEANS
```sas
PROC MEANS DATA=booklengths N MEAN MEDIAN CLM ALPHA=.10;
```

### Testing Categorical Data with PROC FREQ
Options Here are a few of the statistical options available:
 AGREE
CHISQ
CL
CMH EXACT MEASURES
PLCORR RELRISK TREND

requests tests and measures of classification agreement including McNemar’s test, Bowker’s test, Cochran’s Q test, and kappa statistics
requests chi-square tests of homogeneity and measures of association requests confidence limits for measures of association
requests Cochran-Mantel-Haenszel statistics
requests Fisher’s exact test for tables larger than 2X2
requests measures of association including Pearson and Spearman correlation coefficients, gamma, Kendall’s tau-b, Stuart’s tau-c, Somer’s D, lambda, odds ratios, risk ratios, and confidence intervals
requests polychoric correlation coefficient requests relative risk measures for 2X2 tables requests the Cochran-Armitage test for trend

```sas
DATA bus;
INFILE 'c:\MyRawData\Bus.dat'; INPUT BusType $ OnTimeOrLate $ @@;
PROC FREQ DATA = bus;
TABLES BusType * OnTimeOrLate / CHISQ; TITLE;
RUN;
```

### Examining Correlations with PROC CORR

- By default, PROC CORR computes Pearson product-moment correlation coefficients. You can add options to the PROC statement to request non-parametric correlation coefficients. The SPEARMAN option in the statement below tells SAS to compute Spearman’s rank correlations instead of Pearson’s correlations:
```sas
PROC CORR SPEARMAN;
```
- Other options include HOEFFDING (for Hoeffding’s D statistic) and KENDALL (for Kendall’s tau-b coefficients). Many other options are available with PROC CORR including options for saving statistics in an output data set.

```sas
DATA class;
INFILE 'c:\MyRawData\Exercise.dat';
INPUT Score Television Exercise @@;
PROC CORR DATA = class;
VAR Television Exercise;
WITH Score;
TITLE ’Correlations for Test Scores’;
TITLE2 ’With Hours of Television and Exercise’;
RUN;
```
- This report starts with descriptive statistics for each variable and then lists the correlation matrix which contains: correlation coefficients (in this case, Pearson), and the probability of getting a larger absolute value for each correlation.
- In this example, both hours of television and hours of exercise are correlated with test score, but exercise is positively correlated while television is negatively correlated. This means students who watched more television tended to have lower scores, while the students who spent more time exercising tended to have higher scores.
### Using PROC REG for Simple Regression Analysis
```sas
DATA hits;
INFILE 'c:\MyRawData\Baseball.dat'; INPUT Height Distance @@;
* Perform regression analysis, plot observed values with regression line; PROC REG DATA = hits;
MODEL Distance = Height;
PLOT Distance * Height;
TITLE 'Results of Regression Analysis';
RUN;
```

### Using PROC ANOVA for One-Way Analysis of Variance

```sas
DATA basket;
INFILE 'c:\MyRawData\Basketball.dat'; INPUT Team $ Height @@;
* Use ANOVA to run one-way analysis of variance; PROC ANOVA DATA = basket;
CLASS Team;
MODEL Height = Team;
MEANS Team / SCHEFFE;
TITLE ”Girls' Heights on Basketball Teams”;
RUN;
- In this case, Team is the classification variable and also the effect in the MODEL statement. Height is the dependent variable. The MEANS statement will produce means of the girls’ heights for each team, and the SCHEFFE option will test which teams are different from the others. The output from the above program is shown and discussed in section 8.8.
```
