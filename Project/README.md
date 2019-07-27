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

- ID (patient identification number)
- RACE/ETHNICITY (1=Caucasian, 2=Black, 3=Hispanic, 4=Asian)
- WTKG (weight in kg)
- GLUC (random blood glucose, in mg/dL)
- HBA1C (hemoglobin A1C, in %)

### [Type 2 Diabetes code](Project/Type2D.sas)

- [What] is Type 2 diabetes
  - Type 2 diabetes is a long term disorder which impact the way human metabolizes sugars (glucose)
  - Common symptoms include increased thirst, frequent urination, and unexplained weight loss
- [WHY] to analyze Type 2 diabetes
  - Affects the blood vessels and nerves and probably leading to severe morbidity if not properly controlled
  - Type 2 diabetes is associated with a ten-year-shorter life expectancy. 
- [How] to analyze Type 2 diabetes
  - Identified 491 male diabetics patients at their first time a large urban teaching hospital.
  - Potentially important in the etiology of diabetes
    - Race/ethnicity (white, black, Hispanic, or Asian) 
    - weight (kg)
    - a random blood glucose measurement (mg/dL)
    - a measurement of hemoglobin A1c (HbA1c; %)
  - Data analysis
    - Assess hemoglobin level between race groups
      - whether the mean HbA1c level (in %) differed across the four race/ethnicity groups. 
      - If so, they would investigate all possible pairwise race/ethnicity group comparisons of HbA1c. 
      - whether the average of the group means for white and Hispanic patients differed significantly from the average of the group means for blacks and Asians. 
    - Regression of blood glucose levels with other continuous variables
      - blood glucose levels (in mg/dL) versus weight (kg) and 
      - blood glucose levels (in mg/dL) versus hemoglobin A1C(%),
      - whether and how these two regression relationships differed across the four race/ethnicity groups. 
    - Model selection

## Method

- Mean Hemoglobin A1C (%) across the four race/ethnicity groups
  - Check homogeneity of variances among four groups by adding “hovtest” in SAS.
  - One-way ANOVA show difference between mean Hemoglobin A1C (%) across these four groups,
  - Investigate all possible pairwise race group comparisons of hemoglobin A1C (%) and Scheffé's method tends to give narrower confidence limits and is therefore the preferred method. 
  - Because we are interested in testing whether the average of the group means for white and Hispanic patients differed significantly from the average of the group means for blacks and Asians, we add “estimate” line in SAS to request the estimate and SE for the contrast that we are interested in.
  - Backward selection among possible independent variables: hemoglobin A1C (%), weight (kg), hemoglobin A1C multiply weight, squared weight, squared hemoglobin A1C. After selecting proper model, we make overall regression model and regression model by four race, and then we use proc glm to estimate interaction by race with two independent variables. All tests performed were 2-tailed in our study. Our chosen significance level is 0.05 throughout the whole study and a p-value less than 0.05 indicates statistical significance in our study.

## Results

### Race

- Total number of the patient number of white, black, Hispanic, and Asian are 123,135,109,124
- Mean of hemoglobin A1C (%) are 7.60, 7.89, 7.78, and 7.25 respectively. 
- The hemoglobin A1C (%) have same variances among four race group P-value of testing homogeneity of hemoglobin A1C (%) variance is 0.32>0.05, meaning . 
- ANOVA shows mean hemoglobin A1C (%) differed across the four race groups (F value = 1.18, p < .0001). 

- The pairwise of white and Black, white and Hispanic, Asian and Black, Asian and Hispanic are significantly different (p<.05) and on the contrary, the pairwise of white and Asian, Black and Hispanic are not significantly different (p >.05).  The average of the group means for white and Hispanic patients is not differed significantly from the average of the group means for blacks and Asians (p = .9775).
-  Model
  - step 1 removed the variable Weight (kg)*hemoglobin A1C (%) with p value =0.68(F value =0.17); 
  - step 2 removed the variable Weight (kg)*hemoglobin A1C (%) with p value =0.62 (F value =0.24); 
  - step 3 removed the variable Square of hemoglobin A1C (%) with p value =0.32 (F value =0.98); 
  - The variable of hemoglobin A1C (%) and the variable of Square of weight (kg) remained. 
Therefore, the overall regression model can be expressed as:

GLUC=-36.69+0.001*〖weight〗^2+22.72 HBA1C
The white group regression model can be expressed as:
GLUC=-41.36+0.001*〖weight〗^2+23.81 HBA1C
The black group regression model can be expressed as:
GLUC=-71.51+0.002*〖weight〗^2+26.45 HBA1C
The Hispanic group regression model can be expressed as:
GLUC=-40.00+0.002*〖weight〗^2+22.70 HBA1C
The Asian group regression model can be expressed as:
GLUC=-41.98+0.002*〖weight〗^2+23.742 HBA1C
Where GLUC represents blood glucose levels (in mg/dL), the weight^2means variable of squared weight (kg) and the hemoglobin A1C (%) means variable hemoglobin A1C (%). All parameters in these models are valid (p <.05). From Table 4, the p value of interaction on hemoglobin A1C (%) by race are 0.95, 0.32, 0.81 for white, black and Hispanic groups respectively; and p value of interaction on weight^2 by race are 0.43, 0.81, 0.93, for white, black and Hispanic groups respectively.

 After analyzing the data collected by investigators, we conclude that the mean hemoglobin A1c level (%) differed across the four race groups (p <.0001), and that the pairwise of white and Black, white and Hispanic, Asian and Black, Asian and Hispanic are statistically significantly different (p<.05), and that the average of the group means for white and Hispanic patients is not significantly differed from the average of the group means for blacks and Asians (p =.9775). After using backward selection in regression model considering blood glucose levels (mg/dL) to be dependent variable, we include two independent variables: square of weight variable and hemoglobin A1C (%). This regression relationship differed across the four race groups with different intercept and different parameters respectively, but there is no modification evidence for race (all p> .05). 

### Discussion:

- From the results, with the same variances, the conclusion is that mean of hemoglobin A1C (%) differed across the four race groups, and that the pairwise of white and Asian, Black and Hispanic are same.  Because these two pairwise exist, so that it is easy to understand the conclusion that the average of the group means for white and Hispanic patients is same as the average of the group means for blacks and Asians (p = .9775).
- From the regression model in results, we could conclude that all the predictors in the model are signiﬁcant, so it is a valid model. Except for the intercept predictor, there are two predictors in the model. In this case, our five model’s estimate parameter of squared weight predictor are all positive, meaning blood glucose levels have a positive association with squared weight (kg), which is corresponded to our common sense that heavy people may have a higher chance of high blood glucose levels.  The hemoglobin A1C (%) predictor has significantly positive association with blood glucose levels (in mg/dL) in all five models, and this is also corresponded to the fact that A1C test can be used to diagnose type 2 diabetes and prediabetes. The higher the glucose level in your bloodstream, the more glucose will attach to the hemoglobin. Since this is the one with the best results in backward selection, the overall regression model is conﬁrmed as the ﬁnal model of the linear regression analysis and therefore, we get regression model for four groups respectively. However, we can see that the black group’s parameters (intercept and slope) are slight different with other race groups from Table 3, so there may be modification by race. After the analysis, we confirmed there is no interaction exist by race in the overall model.
We should also be aware that this is a simpliﬁed model from a relative small sample and we only considered the adult males’ information here. A more reliable analysis should not just consider male patients and should include external and environmental factors such as geographic area, air quality, etc.

### References:
[1]. Kleinbaum, D.G., Kupper, L.L., Muller, K.E., and Nizam, A. (1998). Applied Regression Analysis and Multivariable Methods, 3rd, 4th or 5th edition, Duxbury Press.
[2]. Kutner, M.H., Nachtsheim, C.J., Neter, J., and Li, W. (2005). Applied Linear Statistical Models, 5th edition. WCB McGraw-Hill/Irwin, Boston.

