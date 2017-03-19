
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

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

mapply(rep,1:4,4:1)

mapply(rnorm, 1:5,1:5,2)

x<- c(rnorm(10), runif(10),rnorm(10,1))
f<- gl(3,10)
tapply(x,f,mean)

split(x,f)

lapply(split(x,f),mean)



x<- rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
interaction(f1,f2)

str(split(x,list(f1,f2)))

str(split(x,list(f1,f2),drop = T))


mean(z)
traceback()

lm(z-p)
traceback()

debug(lm)
lm(z-p)

#options(error = recover)
mean(z-p)

## QUIZ 



