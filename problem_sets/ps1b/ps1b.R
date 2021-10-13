## ---------------------------
## R version 3.6.3 (2020-02-29)
## Script name: ps1b.R
##
## Purpose of script: run code necessary for ps1b for ARE 213
##
## Author: Aaron Watt
## Email: aaron@acwatt.net
##
## Date Created: 2021-10-12
##
## ---------------------------
## Notes: Need to open Rporj in ps1b folder. This will set the working directory
##  to this folder.
##


## PACKAGES ====================================================================
# install.packages("pacman")
# install.packages("plm")
# install.packages('foreign')
# install.packages('stargazer')
# install.packages("finalfit")
library(tidyverse)
library(foreign)
library(xtable)
library(stargazer)
library(finalfit) 

#===============================================================================
#                                 PROBLEM 1
#===============================================================================

## Data cleaning from PS 1a  . . . . . . . . . . . . .
data = read.dta('ps1.dta')
missing_codes = read.csv('missing_codes.csv')
mvars = as.character(missing_codes$varname)
missing_codes$num_missing = as.integer(0)
for (row in 1:nrow(missing_codes)) {
  var = as.character(missing_codes[row, "varname"])
  code  = as.numeric(missing_codes[row, "missing_code"])
  nmissing = as.integer(sum(data[, var] == code))
  missing_codes$num_missing[missing_codes$varname==var] = nmissing
  data[, var] = na_if(data[, var], code)
}
# Dataframe with missing dropped
df = data[complete.cases(data), ]


## PART (b) . . . . . . . . . . . . . . . . . . . . . 
#   Estimate the smoking effects using a flexible
#   functional form for the control variables



## PART (c) . . . . . . . . . . . . . . . . . . . . . 
#    Use the LASSO to determine which covariates to include




#===============================================================================
#                                 PROBLEM 2
#===============================================================================

## PART (a) . . . . . . . . . . . . . . . . . . . . . 
#   create the propensity score using logit
#   using all of the “predetermined” covariates


# then try logit with only the significant covariates



## PART (b) . . . . . . . . . . . . . . . . . . . . . 
# Control for p-score in regression analysis


# Estimate ATE



## PART (c) . . . . . . . . . . . . . . . . . . . . . 
# Reweight data using p-score to weight


# Estimate ATE


# Estimate TOT with rewieghted data



## PART (d) . . . . . . . . . . . . . . . . . . . . . 
# Estimate the counterfactual birthweight densities with a kernel density estimator
# See Joel's notes for kernel density estimator
# Play around with a bandwidth starting with half the default Stata bandwidth
# For stata bandwidht, see rkdensity.pdf page 9 in this ps1b github folder.
# You can also run on stata with no bandwidth specified, then print the
# default bandwidth used using `display r(bwidth)`
# Choose the same bandwidth for all the pictures


# Graph both kernel densities over range of birthweight in the same plot


# calculate the kernel estimator at birthweight equals 3,000 grams



## PART (e) . . . . . . . . . . . . . . . . . . . . . 
# Plot one of your densities with multiple bandwidths in addition to the one used above



## PART (f) . . . . . . . . . . . . . . . . . . . . . 
# Might need to display summary stats for people with high and low p-scores



## PART (g) . . . . . . . . . . . . . . . . . . . . . 
# Create tables to present relationship between birthweight and smoking




#===============================================================================
#                                 PROBLEM 3
#===============================================================================
# estimate the “non-parametric” conditional mean of birth weight as a function 
# of the estimated probability of smoking, separately for smokers and non-smokers


# divide the data from smokers/ non-smokers into 100 approximately equally spaced
# bins based on the estimated propensity score.


# Use blocking estimator discussed in class




#===============================================================================
#                                 PROBLEM 4
#===============================================================================
# Create indicator for <2500 grams


# Redo question 3 using indicator instead of birthweight




#===============================================================================
#                                 PROBLEM 5
#===============================================================================

## PART (a) . . . . . . . . . . . . . . . . . . . . . 
# Select variables
df5a = df %>% 
  select(birthweight, rectype, pldel3, cntocpop, stresfip, 
         dmage, mrace3, dmar, adequacy, csex, dplural)

# Run regression


## PART (b) . . . . . . . . . . . . . . . . . . . . . 
# Select vars and smoking indicator
df5b = df %>% 
  select(birthweight, rectype, pldel3, cntocpop, stresfip, 
         dmage, mrace3, dmar, adequacy, csex, dplural)

# Run regression



## PART (c-d) . . . . . . . . . . . . . . . . . . . . . 
# weighted version of the exact matching estimator that estimates the
# same thing as the regression above

# Compare to regression from (b)



## PART (f) . . . . . . . . . . . . . . . . . . . . . 
# Compute a standard error for your matching estimator using the formula from Imbens (2015).


# compute the conditional variance of estimator from (d)





#===============================================================================
#                                 PROBLEM 6
#===============================================================================
# Summarize and give intuition
# Is our best estimate of the effects of smoking credibly identified?






