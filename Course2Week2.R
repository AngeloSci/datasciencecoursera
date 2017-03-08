
setwd("D:/GithubLocal/datasciencecoursera/")

above <- function (x, n=10){
    use <- x > n
    x[use]
    
}


x = 1:50

above(x)
above(x,25)


#QUIZ
cube <- function(x, n) {
    x^3
}

cube(3)


x <- 1:2
if(x > 5) {
    x <- 0
}


rm(x)


f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z <- 10
f(3)


rm(x,y)

x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}