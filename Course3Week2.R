

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
