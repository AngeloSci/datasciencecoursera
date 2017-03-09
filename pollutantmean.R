# PART 1

pollutantmean <- function(directory, pollutant, id = 1:332){
    

    lnid <- length(id)
    data <- list()
    colm <- numeric()
    
    if (pollutant == "nitrate"){
        colm <- 3
    }else if (pollutant == "sulfate"){
        colm <-2
    }
    
    
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
    
    agg_data <- data.frame()
    
    for (ii in 1:lnid){
        if (ii == 1){
            agg_data <- data.frame(data[[ii]])
        }else{
            agg_data <- rbind(agg_data,data.frame(data[[ii]]))
        }
    }
    
    cond1 <- !is.na(agg_data[,colm])
    
    clean_data <- agg_data[cond1,]
    
    mean(agg_data[cond1,colm])
}