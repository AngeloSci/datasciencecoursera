# PART 1

complete <- function(directory, id = 1:332){
    


    lnid <- length(id)
    data <- list()
    
    
    
    for(ii in 1:lnid){
    
        if(id[ii] < 10){
            strid <- paste("00",as.character(id[ii]), sep="")
        }else if (id[ii]<100){
            strid <- paste("0",as.character(id[ii]), sep="")
        }else{
            strid <- as.character(id[ii])
        }    
        
       data[[ii]] <-  read.csv(paste(directory,"/",strid,".csv",sep=""))
    }
    
    res_data <- data.frame()
    
    for (ii in 1:lnid){
            
            tmp_noobs <- sum(complete.cases(data[[ii]]))
        
            res_data[ii,1] <- id[ii]
            res_data[ii,2] <- tmp_noobs
        
    }
    
    colnames(res_data) <- c("id","nobs")
    return(res_data)
}