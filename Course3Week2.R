

setwd("D:/GithubLocal/datasciencecoursera/")

library(RMySQL)

ucscDb <- dbConnect(MySQL(),user = "genome", host ="genome-mysql.soe.ucsc.edu")

result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);

result


hg19 <- dbConnect(MySQL(),user = "genome", db= "hg19" ,host ="genome-mysql.soe.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:5]

dbListFields(hg19, "affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2") 
head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query, n=10); dbClearResult(query);
dim(affyMisSmall)

dbDisconnect(hg19)


#HDF5
#source("https://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

library(rhdf5)

created = h5createFile("example.h5")
created
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")

h5ls("example.h5")

A = matrix(1:10, nr=5,nc=2)
h5write(A, "example.h5","foo/A")
B = array(seq(0.1,2,by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")
h5ls("example.h5")

df = data.frame(1L:5L,seq(0.1,1,length.out = 5),c("ab","cde","fghi","a","s"), stringsAsFactors = F)
h5write(df, "example.h5","df")
h5ls("example.h5")

readdf = h5read("example.h5","df")
readdf

# write 12,13,14 in the first three rows and first column of dataset foo/A
h5write(c(12,13,14), "example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")



### WEB SCRAPING 

con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)


library(httr)
html2 = GET(url)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText=T)
xpathSApply(parsedHtml,"//title",xmlValue)

pg1 = GET("http://httpbin.org/basic-auth/user/passwd")

pg2 = GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2
names(pg2)


google = handle("http://google.com")
pg1 = GET(handle=google,path="/")



##### API

myapp = oauth_app("twitter",key="",secret="")
sig=sign_oauth1.0(myapp, token ="",token_secret = "")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)
#to get it as df
json2 = jsonlite::fromJSON(toJSON(json1))


### OTHER SOURCES

