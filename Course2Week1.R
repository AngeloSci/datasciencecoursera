
setwd("D:/GithubLocal/datasciencecoursera/")

x <- vector()

x <- 1:20

attributes(x)

class(x)

x <- vector("character",10)

y <- c("a",1.7)
class(y)

z <- 2:6
p <- z*2

cbind(z,p)
rbind(z,p)


fc <- factor(c("male","female","female","male","female"))
table(fc)
unclass(fc)

fl <- factor(c("high","very high","low","high"), levels = c("very high","high","low"))
unclass(fl)

nrow() 
ncol()  #for data frames

dimnames()  #list of names for rows and cols of a MATRIX

sapply() #apply function over list or vector


dput(x, file = "puttingTest.R")
dget("puttingTest.R")

dump(c("x","y"), file = "dumpingTest.R")
rm(x,y)
source("dumpingTest.R")