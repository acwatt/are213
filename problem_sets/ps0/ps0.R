## ---------------------------
## R version 3.6.3 (2020-02-29)
## Script name: ps0.R
##
## Purpose of script: run code necessary for ps0 fro ARE 213
##
## Author: Aaron Watt
## Email: aaron@acwatt.net
##
## Date Created: 2021-09-13
##
## ---------------------------
## Notes:
##


## PACKAGES ===========================================
# install.packages("pacman")
# install.packages("plm")
library(tidyverse)


## WORKING DIRECTORIES ===============================
# setwd('hw1')

## LOAD DATA =========================================
data1_path = path('PS1_data.csv')
data2_path = path('pecanstreet_monthly.csv')
data3_path = path('pecanstreet_daily.csv')
data1 = read.csv(data1_path)
data2 = read.csv(data2_path)
data3 = read.csv(data3_path)


## SIMILATED DATA ====================================