# PART 1

corr <- function(directory, threshold=0){
    

    id = 1:332
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
    
    corr_vec <- vector(mode = "numeric")
    c_idx =1
    
    for (ii in 1:lnid){
        
        if(res_data[ii,2] > threshold){
            tmp_data <- data[[ii]]
            #cond2 <- complete.cases(tmp_data)
            #tmp_data <- tmp_data[cond2,]
            
            corr_vec[c_idx] <- cor(tmp_data[,2:3], use = "complete.obs")
            c_idx = c_idx +1
        }
        
    }
    
    
}