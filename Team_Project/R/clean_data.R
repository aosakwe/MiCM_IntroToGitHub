## Script to write functions for cleaning dataset
if (!require("tidyverse")){
  install.packages("tidyverse")
}


# 1. change col names -----------------------------------------------------
colnames(breast_cancer) <- c("ID", "clump_thickness", "uniformity_of_cell_size", "uniformity_of_cell_shape",
                             "marginal_adhesion", "single_epithelial_cell_size", "bare_nuclei",
                             "bland_chromatin", "normal_nucleoli", "mitoses", "class")
