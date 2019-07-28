    
### Propensity score in observational study
- [WHAT]
  - It is the conditional probability that a subject receives “treatment” given the subject’s
observed covariates.
- [Why] 
  - Randomized controlled trials have no confounding
  - Observational study have confounding, due to treatments are not applied randomly (for patients could have some attributes differ from ordinary people), leading to selection bias and confounding variables.
  - Mimic what happens in randomized controlled trials (RCT’s) by balancing observed covariates between subjects in control and treatment study groups(Faries, Leon, Haro, Obenchain, 2010).
- [How] 
  - Given the observed covariates, matching observations from each group based on the probability that a patient received the medicine 
  - Isolate the treatment as the only difference between our treatment and control groups
  - Improved confounding variable balance between treatment and control groups
