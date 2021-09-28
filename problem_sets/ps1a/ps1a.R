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
install.packages("finalfit")
library(tidyverse)
library(foreign)
library(xtable)
library(stargazer)
library(finalfit) 


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
mvars = as.character(missing_codes$varname)
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
data %>% ff_glimpse()
data %>% missing_plot()
data %>% missing_pattern()

for (var in colnames(data)) {
  print('*********************************')
  print(var)
  print(sort(unique(data[, var])))
}

# Convert all variables with <7 unique values to factor (and 3 additional variables)
factor_vars = c("isllb10", "birmon", "weekday")
for (var in colnames(data)) {
  print('*********************************')
  print(var)
  print(length(unique(data[, var])))
  if (length(unique(data[!is.na(data[, var]), var])) < 7 || var %in% factor_vars) {
    data[, var] = factor(data[, var])
  }
}

data[, mvars] %>% missing_pairs(position = "fill")
explore_vars = c("cigar", "drink")
data[, explore_vars] %>% missing_pairs(position = "fill")
data[, mvars]  %>% missing_compare()

## PART (c) . . . . . . . . . . . . . . . . . . . . . 
stargazer(df, title="Table 1: Summary Statistics", out="summary_stats_2c.tex")
# For long table (across multiple pages):
# A table environment cannot be broken across pages. 
# Delete \begin{table}\centering and \end{table}, replace tabular with longtable, 
# move \caption and label to immediately after \begin{longtable}{..}. 
# And add \usepackage{longtable} to the preamble, of course.




## PROBLEM 3 =========================================
## PART (a) . . . . . . . . . . . . . . . . . . . . . 
# "dbrwt" = birthweight in grams




## PART (b) . . . . . . . . . . . . . . . . . . . . . 





## PART (c) . . . . . . . . . . . . . . . . . . . . . 






## PART (d) . . . . . . . . . . . . . . . . . . . . . 























