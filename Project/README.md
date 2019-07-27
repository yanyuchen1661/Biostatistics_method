# Projects of Biostatistical method
## Introduction of Myopia project
### [Raw Data](/Project/Myopia_rawdata.sas7bdat)
### [Myopia code](/Project/myopia.sas)
- WHAT is Myopia: common cause of impaired vision of people under age of 40
- WHY to analyze: an urgent world-wide public health issue
  - Uncorrected refractive error (URE) causes a loss in global GDP estimated to be $202 billion per year
  - The prevalence of myopia in United states is doubled in the last 50 years
  - It is predicted that 49.8% of world population will be affected by myopia by 2050
- HOW to address the myopia boom
  - One study: The Prospective Evaluation of Radial Keratotomy (PERK) Study
    - The PERK is a nine-center clinical trial of a standardized technique of radial keratotomy
    - Patients who had myopia with refraction in each eye between -2.00 and -8.00 diopters and above 21 years old were enrolled. 
    - For safety considerations, patients were only allowed to have surgery for one eye in one-year period. 
    - The surgical technique consisted of eight incisions using a diamond micrometer knife with blade length determined by intraoperative ultrasonic pachymetry
    - The diameter of central clear zone determined by preoperative refraction (-2 to -3.12 = 4.0mm; - 3.25 to -4.37 = 3.5mm; -4.5 to -8.00 = 3.0 mm). With a smaller clear zone, the incisions would hopefully result in a greater change in refraction. 
## Method
- How to idenfity the improvement of myopia?
  - The change in refraction before surgery and one year after surgery is measured to evaluate the effectiveness of the radial keratotomy. 
  - A clinically important change refers to a change in refraction > 1 diopter after surgery. 
  - A clinically important effect refers to a mean difference in change between groups > 0.5 diopters. 
- How to conduct data analysis? 
  - presented both demographic and clinical characteristics
    - age
    - gender
    - use of soft contact lens before surgery
    - intraocular pressure
    - The diameter of the clear zone.
  - Statistical evaluation for the outcome of radial Keratotomy
    - Mean of change in refraction for patients before and one year after the surgery
    - Percentage of patients achieved good refractive outcome
    - Association between each of the characteristics and the change in refraction before and one year after the surgery, 
      - categorical variable
        - Two sample t-test with F test for test variance homogenity. 
        - T test assumes the data is large and normally distributed with random sampling design
      - Age and intraocular pressure
        - Age was divided into four groups
          - 20- 30 years (20s)
          - 30-40 years (30s)
          - 40-50 years (40s)
          - 50-60 years (50s). 
        - IOP (intraocular pressure) was divided into two groups: 
          - IOP less than median
          - IOP more than median
     - Association between each of the characteristics and the refractive outcome
       - Categorical variables
          - Chi-Squared test assume independence of groups within characteristic, the expected number of observations in each cell of the contingency table be greater than 5.
          - Fisher’s Exact test assumes random samplinga and small sample size.
       - Continious variables
          - Age and IOP, we divided the data into groups as we did before. 
- Two-tailed and significance level is 0.05

## RESULT

### Demographics of the PERK study

- The mean age of study population is 33.78 with a standard deviation(std) of 7.44. 
- Patients’ IOP has a mean of 14.43 with a std of 3.14. 
- 205(53.11%) males and 181(46.89%) females participated in study. 
- 261 patients (67.62%) have not used soft contact lens before surgery. 
- 133, 129 and 124 patients have the diameter of the central clear zone in 3mm, 3.5mm, and 4mm, respectively.
- After surgery, the mean refraction is -0.299 diopters with standard deviation of 1.22 diopters range from -4.25 to 3.25 diopters. - --- About 65% of patients have a good outcome in -1 to +1 diopters inclusively with a 95% CI of (-0.42, 0.18). 
- The change in refraction from baseline is statistically and clinically significant different from 0 in value 3.70 (95% CI: (3.56,3.83)).

### Age

- In age of 20s and 30s, 20s and 40s, 20s and 50s, 30s and 40s, 30s and 50s, 40s and 50s, each two age groups have statistically significant different change in refraction of -0.53(p=.0003, 95%CI: (-0.82,-0.25)), -1.01(p<.0001, 95%CI: (-1.46,-0.57),  -2.25(p<.0001, 95%CI: (1.192, 1.511)), -0.48(p<.017, 95%CI: (-0.79,-0.09)), -1.72(p<.0001, 95%CI:(1.125, 1.367)), -1.24(p=.009, 95%CI: (1.268, 1.798)) (Table 2), and in Chi-squared tests (except for 30s to 50s applying Fisher’s Exact test), each two age groups did not have a statistically significant association with good refraction outcome (p= 0.24, 0.77, 0.24, 0.23, 0.058, 0.35 respectively) (Table 3).

### Preoperative intraocular pressure

- Separated by the median of IOP (14.33), we got 195 patients whose IOPs are below median and 191 patients whose IOPs are above median. The difference of mean change in refraction between the two groups has a mean of -0.38 with a 95% CI (-0.65, -0.10). 
- The p-value of F-test is 0.49, showing that the two group have equal variances. Thus, the statistic of t-test is -2.70 (p=0.01). The results show that the mean change in refraction is statistically significantly different between these two groups. 
- However, the result would not suggest a clinically important effect (difference of mean change < 0.5). 
- We choose to run a Chi-Square test to analyze the association between IOP and the outcome of the surgery (min(Eij)=66.8). The p-value of chi-square test (=0.18) is larger than 0.05. 
- The result shows that the IOP of patients is not statistically significantly associated with whether or not the patients obtained a good refractive outcome.

### Gender 

- 205 (53.11%) are males and 181 (46.89%) are females. 
- The p-value of F test is 0.0046. With unequal variances, the result of t test (p=0.0077) show that there is an effect of gender on the change in refraction after surgery. 
- The mean for difference between gender groups is 0.3703 with a 95% CI (0.0987, 0.6518). The results show statistically significant association between gender and change of refraction after surgery. 
- However, this difference is not clinically important (difference of mean change < 0.5). 
- We choose to run Chi-Squared test to evaluate the association between gender and the outcome of the surgery (min(Eij)=63.3). We find that gender of patients has no statistically significant association (p=0.18) with whether or not the patients obtained a good refractive outcome. 

### Use of soft contact lens before surgery

- 125 patients (32.38%) have used soft contact lens before surgery and 261 (67.62%) have not used soft contact lens before surgery. 
- The result of F test indicates that the variances of the two groups are equal. 
- With equal variances, the results of t test (p=0.0003) show that there is an effect of use of soft contact lens before surgery on the change in refraction after surgery. 
- The mean for difference between group is 0.5402 with a 95% CI (0.2493, 0.8312). 
- The results show both statistically significant and clinically important association between gender and change of refraction after surgery. 
- We choose to perform Chi-Squared test to evaluate the association between between the use of soft contact lens before surgery and the outcome of the surgery (min(Eij)=43.7). We find that the use of soft contact lens before surgery has a statistically significant association (p=0.0037) with whether or not the patients obtained a good refractive outcome.

### Diameter of the central clear zone 

- We ran t-test in DCZ for 3 times with diameter of clear central zone of 3 and 3.5, 3 and 4, 3.5 and 4, and all of these tests had statistically and clinically significant difference of 1.17(p <.0001 95% CI: (0.86, 1.47)), 1.90(p <.0001 95% CI: (1.61, 2.18)), 0.73 (p <.0001 95% CI: (0.47, 0.97)), respectively. 
- We use Chi-Squared test to show the association between the diameter of clear central zone and the good refractive outcome. With diameter of clear central zone of 3 and 3.5, 3 and 4, 3.5 and 4, and all of these tests had statistically significant association with good outcome, p=0.0001, p<.0001, p=0.037 respectively.

## Discussion

- Since the statistical methods we’ve learned is limited, we have to roughly separate the patients into two groups to evaluate whether Characteristic are related to the change in refraction and the outcome of surgery. The results are very brief and not persuasive enough. Such as IOP, as a continuous variable, being divided by median causes a massive information loss of IOP. 
- We will achieve more believable results after we study more statistical methods.
- In t-test, each pair of age group (except for age group 30s and 40s), and used soft contact lens before surgery and DCZ have statistically and clinically significant difference with change of refraction (e.g. the more difference in the DCZ group, the more difference the change will have). Age group 30s and 40s, gender groups and two preoperative intraocular pressure group and two IOP groups are statistically but not clinically different within each group. 
- Results from Chi-Squared test indicates that IOP, age, gender (female or male) has no statistically significant association with the refractive outcome of surgery (good or not) while the use of soft contact lens before surgery and diameter of the central clear zone have statistically significant association with the refractive outcome.
- Therefore, before the surgery, the important factors are use of soft contact lens before and diameter of the central clear zone

## Introduction of Type 2 Diabetes project
### [Raw Data](/Project/T2D_rawdata.sas7bdat)
### [Type 2 Diabetes code](Project/Type2D.sas)

