## Script to write functions for cleaning dataset
if (!require("tidyverse")){
  install.packages("tidyverse")
}


Gap<-readRDS('./data/gapminder_unfiltered.rds')
