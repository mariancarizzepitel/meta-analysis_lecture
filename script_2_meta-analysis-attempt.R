library(tidyverse)
library(metaPsychometric)

#Load data
ex3_data <- read_csv("meta_data_ex3.csv")

#Overall analysis 
ex3_results <- meta_bare_bones(ex3_data)
print(ex3_results)

#Breakdown by country to determine if country has a moderating effect
ex3_data_canada <- ex3_data %>% filter(country=="Canada")
ex3_data_usa <- ex3_data %>% filter(country=="United States")

#Canada Analysis 
ex3_results_canada <- meta_bare_bones(ex3_data_canada)
print(ex3_results_canada)

#USA Analysis 
ex3_results_usa <- meta_bare_bones(ex3_data_usa)
print(ex3_results_usa)

#Canada analysis - correct for unreliability
ex3_results_correct_canada <- meta_corrected(ex3_data_canada)

#USA Analysis - correct for unreliability 
ex3_results_correct_usa <- meta_corrected(ex3_data_usa)
