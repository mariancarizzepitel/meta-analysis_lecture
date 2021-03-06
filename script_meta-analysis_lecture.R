library(tidyverse)

#Load meta analyses data 
ex1_data <- read_csv("meta_data_ex1.csv")

#glimpse(ex1_data)
##main info shown: columns, first few observations
##nicer, more straightforward version of str()

library(metaPsychometric)
?metaPsychometric
#barebones vs. corrected meta-analysis 

#Calculate bare bones meta-analysis output 
ex1_results <- meta_bare_bones(ex1_data)
#ex1_results
#$ N_total  : num 506179 - number of participants
#$ K        : int 1000 - number of studies
#$ r_bar    : num 0.301 - population correlation 
#$ var_obs  : num 0.00163 - variance of all the studies 
#$ var_exp  : num 0.00164 - variability expected due to random sampling
#$ var_res  : num -1.02e-05 - 
#$ sd_res   : num 0
#$ per_error: num 101 - var-exp divided by var-observed. if less than 75%, assume moderators. if more than 75%, assume all due to random sampling error 
#$  LL      : num 0.298 - 95% confidence interval LL 
#   UL       : num 0.303 - confidence interval UL - pretty narrow 
#$ cred_LL  : num 0.301 - since no diff between cred range UL and LL, 
#$ cred_UL  : num 0.301 - assume no moderators 

meta_plot_funnel(ex1_results) #distribution of correlations plus funnel from sampling theory
meta_plot_funnel(ex1_results, show_null_dist=TRUE) #same info plus NULL distribution (distribution of points if there was no true effect)
meta_plot_forest(ex1_results) #shows point estimates and confidence intervals of individual studies as well as meta-analytic estimate + CI

#if you find evidence of moderator, filter data and run subgroup analyses
##e.g., ex3_Canada <- ex3_data %>% filter(country=="Canada")
##e.g., ex3_Usa <- ex3_data %>% filter(country=="United States")
##check for evidence of moderators

#Use meta_corrected
#To correct every study individually and meta-analysis on corrected correlations 
meta_corrected(ex1_results)

