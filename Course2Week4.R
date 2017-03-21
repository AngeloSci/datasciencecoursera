
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

summary(y)
plot(x,y)


set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
b0 <- 0.5
b1<- 2
y<- b0 + b1*x +e

summary(y)
plot(x,y)


set.seed(20)
x <- rnorm(100)

log.mu <- 0.5 +0.3*x
y <- rpois(100, exp(log.mu))

summary(y)
plot(x,y)


# Random Sampling 

set.seed(1)

sample(1:10,4)
sample(letters,5)

sample(1:10) #permutation

sample(1:10,replace = TRUE) #w/ replacement


# PROFILER

system.time(
    { x<-rnorm(100,5,10)
    y<- x^2
    }
)



Rprof()
rnorm(1000)
Rprof(NULL)
summaryRprof()

# QUIZ

set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

system.time(x^10000000)


