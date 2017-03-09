rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/")

# PART 1

source("pollutantmean.R")

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "nitrate", 1:332)

# PART 2