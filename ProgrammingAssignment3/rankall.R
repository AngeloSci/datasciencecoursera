rankall <- function(outcome, num = "best") {
    
        
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    
    ## Check that outcome is valid
    if(outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia"){stop("invalid outcome")}
    
    
    ## For each state, find the hospital of the given rank
    
    #defining variable c as number of column for the requested outcome
    c <- integer()
    
    if(outcome == "heart attack"){c <- 11}
    if(outcome == "heart failure"){c <- 17}
    if(outcome == "pneumonia"){c <- 23}
    
    #changing outcome rates in numeric and filtering out NA
    outcome_data[,c] <- as.numeric(outcome_data[,c]) 
    outcome_data <- outcome_data[!is.na(outcome_data[,c]),] 
    

    
    #finding all states codes
    states <- unique(outcome_data[,7])
    
    #looping through all states to find the needed hospital name
    hosp_names <- character()
    
    for (ii in 1:length(states)){

        tmp_outcome_data <- outcome_data
        tmp_num <- num
        #filtering out states <> requested state
        tmp_outcome_data <- tmp_outcome_data[tmp_outcome_data[,7]==states[ii],]
        
        #sorting by ascending outcome rate AND by alphabetical name order to break ties
        tmp_outcome_data <- tmp_outcome_data[order(tmp_outcome_data[,c],tmp_outcome_data[,2], decreasing = F),]
        
        #handling num values
        if(num == "best"){tmp_num <- 1}
        if(num == "worst"){tmp_num <- nrow(tmp_outcome_data)}
        
        #storing best hospital names
        if(tmp_num > nrow(tmp_outcome_data)){
            hosp_names[ii] <- NA
        }else{
            hosp_names[ii] <- tmp_outcome_data[tmp_num,2]
        }
        
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    results <- data.frame(hosp_names[order(states)], states[order(states)])
    colnames(results) <- c("hospital","state")
    
    return(results)
    
}