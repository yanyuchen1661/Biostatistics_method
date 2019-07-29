# Epidemiology
## Epidemiology

**Defination**: The study of the distribution and determinants of health related states or events in specified populations and the application of this study to control health problems.

- States
  - Diabetes 
  - Asthma
  - Epilepsy
  - Level of fitness
- Events
  - Abnormal blood sugar test
  - Shortness of breath attack
  - Seizure
  - A visit to the gym
- Disease：
  - In Individuals
    - Ask person
    - Ask doctor
    - Medical records
    - Perform examination
    - Conduct laboratory tests
  - In population
    - Surveillance
    - Reporting
- Distribution difference
  - Endemic: constant low level of a disease in some group or area.
  - Epidemic: high level in a population 
  - Pandemic: widespread even worldwide
  - Rare disease: less than 200,000 persons in US by Rare Disease Act; doctor cannot see that disease more than once a year by Wikipedia
- Control health problems
  - Primary
    - Passive
      - Fluoridation, 
      - Air bags
      - Folic-acid fortified bread
    - Active
    	- Fluoride mouth wash
	- Seat belts
	- Use of vitamin supplements
  - Secondary: 
    - Pap smears
    - Mammography
    - Diabetes control
    - Hypertension control
  - PKU screening
    - Tertiary
    	- Treatment of disease
	- Rehabilitation therapy
	
## Clinical trails

- Characteristic
  - It is the gold standard
  - Conditions under direct control
  - Randomize individuals to be either exposed or unexposed
- Ethics problem: the strong temptation to subordinate the subjects’ welfare to the objectives of the study
- Limitation
  - Homogeneous population
  - May not be generalizable to the entire people 
  - Woman, kids, elders are excluded
  - Cannot randomize all exposures of interest 

## observational study

### Cohort study

- Characteristic
	- Selection based on group membership or exposure status
	- Directionality: forward (Exposure status before disease)
- Types(difference in data collection): Prospective or retrospective data collection? 
	- Prospective: study start in the beginning
		- Advantages: 
		  - Under control purposely
			- Temporality of exposure and disease is well- established
		- Disadvantages
			- Costly
			- time consuming
	- Retrospective: study start in the ending
		- Advantages: 
			- Less costly
			- Less time consuming
		- Disadvantages
		 - Cannot fit your purpose
- Measures of frequency and association (Risk& Rate)
	- Rate(using if people move in and move out… risk is not accurate)
		- Unit: per XXX PY 
	- Difference between rate and risk:
			- Risk
				- 10 cases per 100,000 persons over 1 year (= 0.0001 = 0.01%)
				- 50 per 100,000 persons over 5 years
			- Rate: 10 cases per 100,000 person-years
		- Risk ratio: Determine individual, but consider burden of society, the situation may change.
		- Risk difference: determine public health importance of a disease
		- Expression:
			- Risk ratio: The risk of disease among the exposed is X times the risk of disease among unexposed.
			- Risk difference: XX per XXX cases of (disease) would not have occurred if exposure to (exposure) was eliminated.
			- Rate ratio: The rate of disease among the exposed is RR times the rate of the unexposed over study follow-up.
- Advantages
	- Can study several diseases
	- Useful for examining rare exposures
	- Temporality: exposure occurred before the disease
- Disadvantages
	- Time consuming
	- Inefficient for rare disease or long period illness
	- Loss of subjects
	

### Case control studies
	
- Characteristic
	- Selection based on disease status
	- Directionality: backward: determine the exposure status of the cases and controls, comparing  disease with and without existing exposure
	- Measures of frequency (none) and association
		- Odds ratio
			- Expression: The odds of exposure(eating at the salad bar) among disease (individuals with diarrhea) is 3.1times the odds of exposure(eating at the salad bar) among no disease(guests without diarrhea )
			- *OR approximate the RR when…
				- Exposure in controls represent the exposure distribution in the source population
				- Cases must be incident cases
				- Disease must be rare
	- Preferable to enroll incident (versus prevalent) cases 
		- If exposure is associated with decreased survival, we may miss many exposed cases and underestimate the true relationship between exposure and disease 
		- Reduces chance of survival bias
- Advantages/ disadvantages for three scenario
	- In hospital
		- Easy to find, willing to participate but exposure distribution may not be the same as the source population
	- In community controls
	- exposure distribution much more likely to be the same as the source population/ expensive, but time consuming and introduce selection bias
	- General: 
		- Cheaper and quicker; 
		- Useful for study rare diseases; 
		- Sample size is smaller than for cohort studies; 
		- Allow for study of several exposure; rapid conclusion.
		- But only study one disease at a time; 
		- Cannot directly estimate the risk of disease; 
		- Careful consideration is required for selecting controls because it may lead to biased results. 
		- Not useful for studying rare exposure; 
		- Temporality of exposure and disease may not be certain; 
		- Higher potential for bias, weakest study design (Higher potential for bias).
		
#### Propensity score

- [WHAT]
  - It is the conditional probability that a subject receives “treatment” given the subject’s
observed covariates.
- [WHY] 
  - Randomized controlled trials have no confounding
- Observational study have confounding, due to treatments are not applied randomly (for patients could have some attributes differ from ordinary people), leading to selection bias and confounding variables.
  - Mimic what happens in randomized controlled trials (RCT’s) by balancing observed covariates between subjects in control and treatment groups(Faries, Leon, Haro, Obenchain, 2010).
- [HOW] 
  - Given the observed covariates, matching observations from each group based on the probability that a patient received the medicine 
  - Isolate the treatment as the only difference between our treatment and control groups
  - Improved confounding variable balance between treatment and control groups
 
### Cross-sectional studies
- Properties
  - Exposure and disease are assessed at the same time
- Measures of association:
  - Prevalence ratio and prevalence difference(existing depression)
			| Prevalence-based | E+ | E- | |
			| --- | --- | --- | --- |	
			| D+ | A | B | A+B |
			| D- | C | D | C+D |
			| | A+C | B+D | Total |
	- Prevalence (E+)=A/ A+C, 
	- Prevalence (E-)=B/ B+D
	- Prevalence(cohort)=(A+B)/ Total
- Expression
	- The prevalence of disease among the exposed is 1.4 times the prevalence of disease among the unexposed 
	- The difference in the prevalence of disease among the exposed versus the unexposed is 0.014
- Advantages
	- Relatively quick and inexpensive
	- Can generate pilot data for a study with clear temporality between exposure and disease
	- Evaluate several exposures and diseases at the same time
	- Helpful for evaluating the disease burden and exposure burden in a population(prevalence)
- Disadvantages
	- Temporal sequence unclear
	- May miss diseases or exposures with short
	
### Random error
- can be reduced by increasing sample size
- but cannot eliminated the effects of uncontrolled bias or confounding
- Types of random error:
	- Type I (alpha,0.05) error(no relation but we say have relation)
	- There is 5% chance that we will say there is an association when there is not. The researcher is willing to accept a 5% risk of committing falsely concluding that the groups differ when in reality they do not.
	- Type II (beta,0.2) error(have relation but we say doesn't have relation)
	- There is a 20% chance that we will say there is no association, when there actually is. Study has an 80% chance of detecting a specified difference in outcome between the treatment groups.
- Statictical inference(Assess random error) : the process of quantify random error
	- use p-value (determine results with null hypothesis): 
		- Definition: 
		- The probablity of observing a result as strong as or stronger than the one that was observed  if the null hypothesis were true.
		- Determinents:
			- Magnitude of the association 
			- Sample size
		- Principles
			- Describe pattern of observation
			- Indicate how incompatible data are with specified statistical model 
			- Does not measure the probability that the studied hypothesis is true or produced by chance alone
			- A small difference may be statistically significant in large sample size
		- Interpretation: 
			- If P is small, rejcet H0 and assume that it is unlikely that the result we observed was due to chance along.
			- 5% probability that you would observe an RR of 3 or greater if there was actually no association in the population, not statistically significant
	- Interval estimation
		- Precision: wider intervals meaning less precise
		- Statistical significance: Interval contains null value,  p>=0.05, not statistically significant; Not contains null value,  p<0.05
		- 95% confidence interval: 
			- Confidence interval
				- a level of certainty about our estimate. 
			- Funtion
			 - Only way to represent how good an estimate is
			- Interpretation
				- If repeated indefinitely, would result in 95% of the confidence intervals formed containing the true value
				
### Selection bias(subjective)

- Occurs when an different effect (relative risk, risk difference) bewteen estimated from the available study population and estimated from source population.

- Source:
	- Case-control studies
		The manner in which cases, controls, or both are selected 
		E.g. Exposed cases are more likely to participate than unexposed cases, and exposure is a risk factor(Overestimate)
		Selection of prevalent (versus incident) cases can cause bias
		E.g. If prevalent cases are selected and exposure affects disease prognosis, duration, and/or survival (e.g., selective survival)
	Cohort and Clinical Trials
	loss to follow-up, withdrawal from the study, or non-response
	E.g. Exposed people who develop the disease drop out at a higher rate than exposed people who don’t develop the disease, and exposure is a risk factor (Underestimate)
	Cross-sectional studies
	selective survival
	E.g. Prevalent diseased with the exposure are more likely to die than prevalent non-diseased with the exposure(Underestimate)
Fix Selection bias in design process
	Randomization 
	High participation rates(In longitudinal studies)
	Complete follow up(In longitudinal studies)
	Appropriate controls (case-control)
	Use incident cases (case-control)
Fix Selection bias in data analysis process
	Correction using selection probabilities


