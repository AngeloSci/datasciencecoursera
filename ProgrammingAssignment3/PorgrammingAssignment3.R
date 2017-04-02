## DATASCIENCE COURSERA - COURSE 2 - PROGRAMMING ASSIGNMENT 2


rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/ProgrammingAssignment3/")



# PLOT THE 30-DAY MORTALITY RATES FOR HEART ATTACK


outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


# FINDING THE BEST HOSPITAL IN A STATE

source("best.R")
best("NY", "pneumonia")

best("TX", "heart attack")

best("MD", "heart attack")

best("TX", "heart failure")

best("MD", "pneumonia")

best("BB", "heart attack")

best("NY", "hert attack")

best("CA", "pneumonia")

# Ranking Hospitals by Outcome in A State

source("rankhospital.R")

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


# Ranking Hospitals in all states
source("rankall.R")

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)


# QUIZ
rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/ProgrammingAssignment3/")


source("best.R")
source("rankhospital.R")
source("rankall.R")

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
