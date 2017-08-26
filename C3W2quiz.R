### QUESTION 1

library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.

myapp <- oauth_app("github",
                   key = "2f12338ec392cf3ec697",
                   secret = "3acda3d48e8e4a73ae8c75441c15378fb13ba4c8")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)



# QUESTION 4
library(XML)




url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html = GET(url)
content2 = content(html, as="text")
parsedHtml = htmlParse(content2, asText=T)
root1 <- xmlRoot(parsedHtml)




con = url(url)
htmlCode = readLines(con)
close(con)
htmlCode
test <- data.frame(htmlCode, stringsAsFactors = F)
result1 <- c(nchar(test[10,1]),nchar(test[20,1]),nchar(test[30,1]),nchar(test[100,1]))


# QUESTION 5
setwd("D:/GithubLocal/datasciencecoursera/")
data <- read.fwf("C3W2Quiz_data.for",width=c(12, 7, 4, 9, 4, 9, 4, 9, 4),skip=4)
sum(data[,4])
