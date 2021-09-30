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


# Create variable "na" if any variable has missing data
df$na <- complete.cases(df)
table(df$na, useNA = "always")

# t Test - Comparison of Means of each variable between two samples
# (Observations with complete data vs Observations with any missing data)
ttest_res <- lapply(names(select(df, -na)), function(x) 
  t.test(as.formula(paste(x, "~", "na")), data = df))

count <- 0
for (i in 1:(length(names(df))-1)) {
  if (ttest_res[[i]]$p.value < 0.05) {
    count <- count + 1
  }
}
count 
# We see support for alternative hypotheses that there is 
# statistical difference between the observations with and without 
# missing observations 37 out of 48 variables at the 95% confidence level.



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

#omaps, fmaps, dbrwt, tobacco, cigar, cigar6
test1 <- t.test(omaps~tobacco, data = df)
test2 <- t.test(fmaps~tobacco, data = df)
test3 <- t.test(dbrwt~tobacco, data = df)

tab <- map_df(list(test1, test2, test3), tidy) %>% 
  rename(Differences_In_Means = estimate, Mean_Maternal_Smokers = estimate1, Mean_Maternal_Non_Smokers = estimate2)

print(xtable(tab, type = "latex"), file = "Q3a.tex")


## PART (b) . . . . . . . . . . . . . . . . . . . . . 
df_3b <- select(df_nona, dmage, ormoth, mrace3, dmar, nlbnl, dlivord, dfage, orfath, dfeduc, csex, cardiac, lung, diabetes, herpes, chyper, tobacco)

sumtable(df_3b, group = 'tobacco', group.test = TRUE)
bal.tab(covs = df_nona, treat=tobacco, data = df_nona)




## PART (c) . . . . . . . . . . . . . . . . . . . . . 






## PART (d) . . . . . . . . . . . . . . . . . . . . . 
reg1 <- lm(dbrwt ~ tobacco + rectype + pldel3 + birattnd + cntocpop + stresfip + dmage + 
             ormoth + mrace3 + dmeduc + dmar + adequacy + nlbnl + dlivord + dtotord + 
             totord9 + nprevist + disllb + isllb10 + dfage + orfath + dfeduc + 
             weekday + csex + delmeth5 + cardiac + diabetes + herpes + chyper + 
             preterm, data = df_nona)

reg2 <- lm(omaps ~ tobacco + rectype + pldel3 + birattnd + cntocpop + stresfip + dmage +
             ormoth + mrace3 + dmeduc + dmar + adequacy + nlbnl + dlivord + dtotord + 
             totord9 + nprevist + disllb + isllb10 + dfage + orfath + dfeduc + 
             weekday + csex + delmeth5 + cardiac + diabetes + herpes + chyper + 
             preterm, data = df_nona)

reg3 <- lm(fmaps ~ tobacco + rectype + pldel3 + birattnd + cntocpop + stresfip + dmage + 
             ormoth + mrace3 + dmeduc + dmar + adequacy + nlbnl + dlivord + dtotord + 
             totord9 + nprevist + disllb + isllb10 + dfage + orfath + dfeduc + 
             weekday + csex + delmeth5 + cardiac + diabetes + herpes + chyper + 
             preterm, data = df_nona)

stargazer(reg1, reg2, reg3, title="Linear Regression Selection on Observables", align = TRUE)






















