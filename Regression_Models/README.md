
# Regression 
## Introduction to Linear Regression
- Learning Objectives
  - Apply statistical theory to public health fields
  - Identify proper statistical designs for sampling and reserach
  - Power analyses 
- Definition
  Relating dependent variables to independent variables
- Relation with other fields
  - Rooted in conditional probability
    - The expected value given the value of predictors
    - Given all relevent coverates, the expected value remains a random variable
  - generalized linear model
    - Function of Y is modeled as a linear function of the indendent variable

### Things need to know

- [WHY] Y is random given fixed x
  - X is fixed
  - Y is random
- [How] should we get the relation
  - Estimate the parameters
    - Y=β0+β1X+E
    - β1 is for every unit increase in X, there is a corresponding increase of β1 in expected value given predictors
    - E denotes random error with mean of 0 and unknown residual variance
    - If E normally distributed, then the estimates would be straight forward
  - Conduct hypothesis
    - Hypothesis assume normal distribution
- SAS code
  - Proc means；var x; run;
- Covariance and Correlation
  - From variance covariance matrix to correlation 
  - If two random variables are independent, then they are uncorelated; The converse is true only when X and Y are bivariate normally distributed
  - In general though, the PMF is used in the context of discrete random variables (random variables that take values on a discrete set), while PDF is used in the context of continuous random variables.
  - The conditional PDF of Y given X can be gotten from the joint PDF and the marginal PDF of X
  - f_y|x(y|x)=f_x,y(x,y)/f_x(x)
  - If X and Y are independent, then fY|X(y|x)=fY(Y)
  - We perfer conditional mean over simply estimating the overall mean of Y, to make variance smaller. Because the variance of Y given the value of X is samller than the overall variance 

## Simple Linear regression
- Assumptions: HEIL Gauss when we conduct statistical inference
  - Homoscedasticity, also known as homogeneity of variance
  - Existence
  - Independence
  - Linearity
  - Gauss, also known as normal distribution of Y given the X's
- Ways to evaluate the assumptions
  - Draw picture

### The Best- Fitting Line (Method of Least Squares)
- Sometime the relationship seems to be straightforward, but hard to determine best fitting line
  - SSE: sum of squares due to error, the minimal is 0
  - Least Squares Estimators (LSE)
    - Unbiased
    - Samllest variances
    - Maximum likelihood estimators (MLEs) for betas when density function of Y gievn X is normal
    - Maximum possible value for the corelation between the data and the predicted values
- Poor when situation change
  - Curve: 
  - Confounding
  
### Predict the value
- Consider the variability
  - From the sampling in population
  - From the new persons
- Results
  - The predictor bands are wider than confience bands for introducing the variance

```sas
ods listing;
data one;
input sbp ldl;
list;
cards;

133 162
144 154
;
run;

proc reg;
  model ldl=sbp;
  output out=out1 predicted=preds l95m=llmean u95m=ulmean
    l95=llpred u95=ulpred;
run;

proc print; run;

```
### ANOVA table and F test
- R-squared
  - Meaning
    - The proportionate reduction in SSY due to regression Y on X
    - The porportion of the total variation in Y 'explained by' regression on X
  - For SLR and MLR, it is the square of the sample correlation between the observed value and the predicted
  - In SLR, this is also equivalent to correlation between the observed value and the predictor

## Multiple Linear Regression

### Overall F test
Whether there is significant overall regression of Y on all predictors
### Multiple partial F test
Whether the two predictors contribute significantly to a model that already accounts for other predictors

- Interpret: beta3 hat is the estimate change in the mean Y for a 1-unit increase in X3, holding x1 and x2 constant.


## Logistic Regression

- Definition
  - model function of the conditional mean of a binary dependent variables
  - Way to incorporate multiple covariates concered with binomial proportions
- ANOVA
- random/fixed effects models
  

  
