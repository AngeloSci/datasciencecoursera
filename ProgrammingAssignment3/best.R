# FINDING THE BEST HOSPITAL IN A STATE

best <- function(state,outcome){
    

    
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    
    ## Check that state and outcome are valid
    if (nchar(state) != 2){stop("invalid state")}
    if (is.na(match(state,outcome_data[,7]))){stop("invalid state")}
    if(outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia"){stop("invalid outcome")}
    
    
    ## Return hospital name in that state with lowest 30-day death rate
    
    #filtering out states <> requested state
    outcome_data <- outcome_data[outcome_data[,7]==state,]
    
    #defining variable c as number of column for the requested outcome
    c <- integer()
    
    if(outcome == "heart attack"){c <- 11}
    if(outcome == "heart failure"){c <- 17}
    if(outcome == "pneumonia"){c <- 23}
    
    #changing outcome rates in numeric and filtering out NA
    outcome_data[,c] <- as.numeric(outcome_data[,c]) 
    outcome_data <- outcome_data[!is.na(outcome_data[,c]),]    
    
    #sorting by ascending outcome rate
    outcome_data <- outcome_data[order(outcome_data[,c], decreasing = F),]
    
    #handling possible ties
    best_data <- outcome_data[outcome_data[,c]==outcome_data[1,c],]
    best_data <- best_data[order(best_data[,2], decreasing = F),]
    
    #returning best hospital name
    return(best_data[1,2])
    
    }
