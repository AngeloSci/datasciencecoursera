

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
