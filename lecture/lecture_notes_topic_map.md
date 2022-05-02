1A: Ordinary Least Squares and Agnostic Regression
1 The Conditional Expectation Function
2 Regression and the CEF
2.1 Reason the First: Regression-CEF Theorem
2.2 Reason the Second: BLP Theorem
2.3 Reason the Third: Regression Approximation Theorem
3 Discussion
4 Machine Learning
5 Application: Predicting College Success


1B: Introduction to Causality and Research Design
1 The Rubin Causal Model
2 Estimation of Treatment Effects: The Randomized Controlled Trial
3 The Stable Unit Value Treatment Assumption: SUTVA
4 Applications and Discussion
4.1 Poorly Defined Treatments
4.2 Poorly Defined Treatments II: Assignment Matters
4.3 Effects of Causes vs. Causes of Effects


1C: Cautionary Notes
1 LaLonde (1986): The NSW
2 Freedman (1991): A Natural Experiment


1C Addendum: LaLonde Paper Detour: Truncation Models and Heckman Selection Models
1 Truncation Model
2 Heckman Selection Model




2A: Selection on Observables Designs: Part I, Regression Adjustment
1 Regression Adjustment
2 How to Choose Controls
3 Regression Adjustment Application: Kreuger (1993) and DiNardo and Pischke (1997)
4 Detecting Bias: Altonji, Elder, and Taber (2005)


2B: Selection on Observables: Part II, Nonparametric Regression
1 Series Regression
2 Kernel Regression
2.1 Kernel Density Estimation
2.2 Kernel Regression
2.3 Lowess Regression
3 The Curse of Dimensionality

2C: Selection on Observables: Part III, Matching, Dimensionality Reduction, the Propensity Score, and a Reality Check
1 Matching
2 Methods of the Propensity Score
2.1 Estimating the Propensity Score
2.2 Regression Adjusting on the Propensity Score
2.3 Blocking on the Propensity Score
2.4 Weighting with the Propensity Score
2.5 Dual Methods: Two Are Better Than One
2.6 Regression Revisited
2.7 Assessing Overlap: LaLonde Revisited
3 Additional Studies of Experimental vs. Observational Data
3.1 Arceneaux, Gerber, and Green: The NSW Euphoria Antidote
3.2 Shadish, Clark, and Steiner: Some Balance
3.3 Conclusions




3Ai: Selection On Unobservables: Fixed Effects and Random Effects Models
1 OLS
2 Random Effects (GLS)
3 Feasible Generalized Least Squares (FGLS)
4 Fixed Effects (FE)
4.1 Within Estimator (FE estimator)
4.2 Differencing Estimators
4.3 Fixed Effects vs. Random Effects
4.4 Measurement Error
4.5 Application: Deschenes and Greenstone (2007)
4.6 Fixed Effects in Other Contexts


3Aii: Selection On Unobservables: Differences-in-Differences
1 Differences-in-Differences
2 Triple Differences
3 Applications: Card (1990), Card & Krueger (1994), Kellogg & Wolff (2008)
4 Event Study Designs


3Aiii: Selection On Unobservables: Case Studies with Synthetic Controls
1 Adadie et al. Synthetic Control Procedure
2 Alternative Procedures


3Bi: Selection On Unobservables: Instrumental Variables
1 Basic IV
2 The Reduced Forms and 2SLS
3 IV Intuition
4 Multiple Instruments
5 Applications
5.1 Medical Trials
5.2 Quarter of Birth


3Bii: Selection On Unobservables: IV with Treatment Effect Heterogeneity
1 Intuition
2 Proof
3 The Monotonicity Assumption
4 Multi-valued Treatments and Instruments


3Biii: Selection On Unobservables: Weak Instruments	
1 Omitted Variables Bias
1.1 Testing for Covariate Balance
2 Finite Sample Bias


3Biv: Selection On Unobservables: Control Function Approaches
1 The Forbidden Regression
2 Control Function Approach


3C: Selection On Unobservables: Regression Discontinuity
1 Introduction
1.1 Background
1.2 The Sharp RD Design
1.3 The Fuzzy RD Design
1.4 The FRD, Matching, and Unconfoundedness
1.5 External Validity
2 Graphical Analysis
2.1 Introduction
2.2 Outcomes by the Running Variable
2.3 Covariates by the Running Variable
2.4 Density of the Running Variable
3 Estimation
3.1 Local Linear Regression and the Sharp RD
3.2 Estimation in the Fuzzy RD
3.3 Optimal Bandwidth
3.4 Alternative Estimators
3.5 Specification Tests
3.6 Discrete Running Variables
3.7 Bias Correction




4A: Statistical Inference: Panel Data and Clustering
1 Bertrand, Duflo, and Mullainathan (2004)
1.1 Literature Review
1.2 Theory
1.3 Simulations
1.4 Solutions
1.4.1 Parametric AR(1) Corrections
1.4.2 Collapse the Data
1.4.3 Arbitrary Variance-Covariance Matrix (Clustered Standard Errors)
2 The Clustered Variance Estimator
2.1 Derivation
2.2 Rules for Clustering
2.3 Additional Complications
2.4 Multi-way Clustering
2.5 Bootstrap Based Improvements


4B: Statistical Inference: Randomization Inference
1 The Lady Tasting Tea and Fisher’s Exact Test
2 Randomization Tests
3 Randomization Tests with Clustering


4C: Statistical Inference: The Bootstrap
1 Bootstrapping the Mean
2 General Bootstrapping Procedure
2.1 The Paired Bootstrap
2.2 The Residual and Parametric Bootstraps
3 The Bootstrap and Clustering
4 Bootstrapping Vs. Randomization Tests


4D: Statistical Inference: Multiple Inference
1 The Multiplicity Problem
2 Solution 1: Reduce the Number of Tests
3 Solution 2: Control FWER
4 Solution 3: Control FDR









