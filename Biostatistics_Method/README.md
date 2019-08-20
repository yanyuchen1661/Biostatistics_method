## Descriptive Statistics
### Measures of Spread
- Range
- Quantiles
- Variance
- Coefficient of Variation = standard deviation / Mean, this measure remains the same regardless of what units are used because if the units change by a factor c, then both the mean and standard deviation change by the factor c; the CV, which is the ratio between them, remains unchanged.
  - Useful in comparing the variability of several different samples, each with different arithmetic means. 
### Graphic methods
- Bar Graphs
- Stem and Leaf plot
- Box Plot
### Relation between two variables
| Types | Graphics | 
| --- | --- |
| Two Categorical Variables | Grouped Bar Chart |
| Categorical and Continuous Variables | grouped Boxplot or histogram at each categorical level |
| Two Continuous Variables | Person's Correlation Coeffecient or Spearman's Rho |

### Probability

#### Conditional Probability
- Relative Risk is probability of disease given exposure compared with disease given non-exposure

- Thus the unconditional probability of developing breast cancer over the next 2 years in the general population (719/105) is a weighted average of the conditional prob- ability of developing breast cancer over the next 2 years among women with a posi- tive mammogram (.1) and the conditional probability of developing breast cancer over the next 2 years among women with a negative mammogram (20/105).

- The sensitivity of a symptom (or set of symptoms or screening test) is the probability that the symptom is present given that the person has a disease.

- The specificity of a symptom (or set of symptoms or screening test) is the probability that the symptom is not present given that the person does not have a disease.

#### Bayes Method

- Bayes Rule
- Generalized Bayes' Rule
- Bayesian Inference
The Bayesian school of inference rejects the idea of the frequency definition of probability, considering that it is a theoretical concept that can never be realized in practice. Instead, Bayesians conceive of two types of probability: a prior probability and a posterior probability.
  - The prior probability of an event is the best guess by the observer of an event’s likelihood in the absence of data. This prior probability may be a single number, or it may be a range of likely values for the probability, perhaps with weights attached to each possible value.
  - The posterior probability of an event is the likelihood that an event will occur after collecting some empirical data. It is obtained by integrating information from the prior probability with additional data related to the event in question.
  
#### ROC

A receiver operating characteristic (ROC) curve is a plot of the sensitivity versus (1 – specificity) of a screening test, where the different points on the curve corre- spond to different cutoff points used to designate test-positive.

Calculate the area under the ROC curve in Figure 3.7, and interpret what it means.
The area under the ROC curve, when evaluated by the trapezoidal rule, is given by
.5(.94 + 1.0)(.57) + .5(.90 + .94)(.10) + .5(.86 + .90)(.11) + .5(.65 + .86)(.19) + .5(0 + .65)(.03) = .89
This means the radiologist has an 89% probability of correctly distinguishing a nor- mal from an abnormal subject based on the relative ordering of their CT ratings. For normal and abnormal subjects with the same ratings, it is assumed the radiologist selects one of the two subjects at random.

In general, of two screening tests for the same disease, the test with the higher area under its ROC curve is considered the better test, unless some particular level of sen- sitivity or specificity is especially important in comparing the two tests.

#### Binomial Distribution

#### Poisson Distribution

- If number excess 100 and enevt rate less than 0.01，can approximate Binormial

#### Normal Distribution

- Large dataset can be seen as 



ANOVA

What ANOVA looks at is the way groups differ internally versus what the difference is between them. 

ANOVA calculates the mean for each of the final grading groups (HD, D, Cr, P, N) on the tutorial exercise figure - the Group Means.
It calculates the mean for all the groups combined - the Overall Mean.
Then it calculates, within each group, the total deviation of each individual's score from the Group Mean - Within Group Variation.
Next, it calculates the deviation of each Group Mean from the Overall Mean - Between Group Variation.
Finally, ANOVA produces the F statistic which is the ratio Between Group Variation to the Within Group Variation.
If the Between Group Variation is significantly greater than the Within Group Variation, then it is likely that there is a statistically significant difference between the groups.

The statistical package will tell you if the F ratio is significant or not.

All versions of ANOVA follow these basic principles but the sources of Variation get more complex as the number of groups and the interaction effects increase.
