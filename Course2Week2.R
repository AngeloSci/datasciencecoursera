
setwd("D:/GithubLocal/datasciencecoursera/")

above <- function (x, n=10){
    use <- x > n
    x[use]
  
}


x = 1:50

above(x)
above(x,25)