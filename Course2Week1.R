
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


con <- url("https://uk.finance.yahoo.com/quote/GBPEUR=X?ltr=1")

wb <- readLines(con)

head(wb)


u <- c(1,2,NA,45,NA)
d <- c(1,NA,3,45,NA)
good <- complete.cases(u,d)

u <- u[good]
d <- d[good]



# QUIZ

x <- 4
class(x)

rm(x)
x <- c(4, TRUE)
class(x)

rm(x)
x <- c(1,3, 5) 
y <- c(3, 2, 10)
cbind(x,y)


rm(x)
x <- list(2, "a", "b", TRUE)
x[[2]]


rm(x,y)
x <- 1:4 
y <- 2
x+y


rm(x,y)
x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x>10] <- 4



rm(list = ls())
setwd("D:/GithubLocal/datasciencecoursera/")

df <- read.csv(file = "hw1_data.csv", header = TRUE, sep = ",")

head(df)
print(df[1:2,])

rn <- nrow(df)
rnpr <- rn-1
print(df[rnpr:rn,])


print(df[47,1])

sum(is.na(df$Ozone))

ozna <- is.na(df$Ozone)

goodoz <- df[!ozna,1]

mean(goodoz)

goodrw <- complete.cases(df$Ozone,df$Temp)
cond <- df$Ozone > 31 & df$Temp >90 & goodrw

dz <- df[cond,]
mean(dz$Solar.R)

rm(goodrw,cond,dz)
goodrw <- complete.cases(df$Month,df$Temp)
cond <- df$Month == 6 & goodrw

dz <- df[cond,]
mean(dz$Temp)


rm(goodrw,cond,dz)
goodrw <- complete.cases(df$Month,df$Ozone)
cond <- df$Month == 5 & goodrw

dz <- df[cond,]
max(dz$Ozone)
