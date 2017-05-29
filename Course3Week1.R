

setwd("D:/GithubLocal/datasciencecoursera/")


if (!file.exists("TestDir")){
    dir.create("TestDir")
}


download.file()

list.files()

library(XML)


fileurl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileurl,useInternalNodes = T)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

fileurl1 <-"http://www.espn.co.uk/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileurl1, useInternalNodes = T)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
team <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)

library(jsonlite)

jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

myjson <- toJSON(iris, pretty =  T)
cat(myjson)
iris2 <- fromJSON(myjson)
head(iris2)
head(iris)


k = {print(10);5}

print(k)

library(data.table)

DT <- data.table(c(1,2,3),c(5,6,7))
DT
DT[,w:=V2^3]
DT
DT[,z:=w<220]
DT[,y:=mean(w),by=z]
DT

### QUIZ

rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz.csv")

data <- read.csv("quiz.csv", sep = ",")


sum(data$VAL == 24 & !is.na(data$VAL))
max(data$VAL[!is.na(data$VAL)])


str(data$FES)

library(xlsx)

dat <- read.xlsx("C3W1quiz.xlsx", sheetIndex =1,startRow = 18, endRow = 23)
dat <- dat[,7:15]
sum(dat$Zip*dat$Ext,na.rm=T)


library(XML)


fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl,useInternalNodes = T)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
zip <- data.frame(xpathSApply(rootNode,"//zipcode",xmlValue))
sum(zip[,1] =="21231")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "quiz2.csv")

DT <- fread("quiz2.csv",sep=",")

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
