
# Regression 
## Linear Regression
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
- Correlation
- Covariance 
## Logistic Regression
- Definition
  - model function of the conditional mean of a binary dependent variables
  - Way to incorporate multiple covariates concered with binomial proportions
- ANOVA
- random/fixed effects models
  

  
