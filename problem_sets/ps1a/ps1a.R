## ---------------------------
## R version 3.6.3 (2020-02-29)
## Script name: ps1a.R
##
## Purpose of script: run code necessary for ps1a fro ARE 213
##
## Author: Aaron Watt
## Email: aaron@acwatt.net
##
## Date Created: 2021-09-27
##
## ---------------------------
## Notes: Need to open Rporj in ps1a folder. This will set the working directory
##  to this folder.
##


## PACKAGES ===========================================
# install.packages("pacman")
# install.packages("plm")
install.packages('foreign')
install.packages('stargazer')
library(tidyverse)
library(foreign)
library(xtable)
library(stargazer)


## PROBLEM 1 =========================================
N = c(40046, 26107, 256423)
D = c(1263, 98, 1422)
R = c(315, 37, 59)

R = D/N*10^4
za = qnorm(0.025, lower.tail=FALSE)
p = 1/N * D
varR = p*(1-p)/N
R_lower = R - 10^4*za*(varR)^0.5
R_upper= R + 10^4*za*(varR)^0.5

df = data.frame(R=R, CI_lower=R_lower, CI_upper=R_upper)
print(xtable(df, type = "latex"))


## PROBLEM 2 =========================================
data = read.dta('ps1.dta')

## PART (a) . . . . . . . . . . . . . . . . . . . . . 
missing_codes = read.csv('missing_codes.csv')
missing_codes$num_missing = as.integer(0)
for (row in 1:nrow(missing_codes)) {
  var = as.character(missing_codes[row, "varname"])
  code  = as.numeric(missing_codes[row, "missing_code"])
  nmissing = as.integer(sum(data[, var] == code))
  missing_codes$num_missing[missing_codes$varname==var] = nmissing
  data[, var] = na_if(data[, var], code)
}
print(xtable(missing_codes, type = "latex", caption = 'Missing values, by variable name.'), 
      caption.placement = 'top', include.rownames=FALSE)

# Dataframe with missing dropped
df = data[complete.cases(data), ]


## PART (b) . . . . . . . . . . . . . . . . . . . . . 





## PART (c) . . . . . . . . . . . . . . . . . . . . . 








## PROBLEM 3 =========================================
## PART (a) . . . . . . . . . . . . . . . . . . . . . 





## PART (b) . . . . . . . . . . . . . . . . . . . . . 





## PART (c) . . . . . . . . . . . . . . . . . . . . . 






## PART (d) . . . . . . . . . . . . . . . . . . . . . 























