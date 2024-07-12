#### Main Script

## This is the main script from which to run your analysis
## From here, you can source the functions created in the other R scripts
## to run your pipeline.


source("./clean_data.R")
source("./visualize_data.R")

library(tidyverse)
##### Load and Clean The Data ####
dat = readRDS(file = "Team_Project/R/data/breast_cancer.rds")|>
  as_tibble()|>
  mutate(across(V1:V9, as.numeric))|>
  na.omit()

#### Generate Statistics of Interest ####

myformula = paste0("V", 1:9, collapse = "+")|>
  {\(i) paste0("class ~ ", i) }()

mod = glm(as.formula(myformula), family =  binomial, data = dat)
summary(mod)

#### Visualize Data ####
par(mfrow = c(3,3))
for(i in 2:10) plot(pull(dat,i),predict.glm(mod), xlab = paste0("V",i))

#### Extra Tasks ####






