
rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/")


x<- 1:5
lapply(x,runif)


lapply(x,runif, min=0, max=10)


#anonymous function
x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
lapply(x,function(asd) asd[,2])


x<- 1:5
lapply(x,mean)
sapply(x,mean)