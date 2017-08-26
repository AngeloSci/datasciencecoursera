

setwd("D:/GithubLocal/datasciencecoursera/")

library(RMySQL)
library(plyr)

X <- data.frame(var1=sample(1:15))
arrange(X,desc(var1))
