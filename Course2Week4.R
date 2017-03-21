
rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/")

str(str)
str(lm)
str(ls)

x <- rnorm(100,2,4)
summary(x)
str(x)

f<-gl(40,10)
str(f)
summary(f)


library(datasets)
head(airquality)
str(airquality)

m<- matrix(rnorm(100),10,10)
summary(m)
str(m)
m[,1]

s<- split(airquality, airquality$Month)
str(s)
summary(s)



#SIMULATION : generation of random numbers

set.seed(1)

rnorm(10,0,2)
rnorm(10,0,2)

set.seed(1)

rnorm(10,0,2)
rnorm(10,0,2)

#SIMULATION : Linear Model

set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
b0 <- 0.5
b1<- 2
y<- b0 + b1*x +e

