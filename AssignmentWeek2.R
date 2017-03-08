rm(list = ls())

setwd("D:/GithubLocal/datasciencecoursera/")



# PART 1

pollutantmean <- function(directory = "specdata", pollutant, id = 1:332){
    
    pollutant <- "nitrate"
    directory = "specdata"
    id = 175
    lnid <- length(id)
    
    for(ii in 1:lnid){
    
        if(id[ii] < 10){
            strid <- paste("00",as.character(id[ii]), sep="")
        }else if (id[ii]<100){
            strid <- paste("0",as.character(id[ii]), sep="")
        }else{
            strid <- as.character(id[ii])
        }    
        
       data<-  read.csv(paste(directory,"/",strid,".csv",sep=""))
    }
    
    
    
    
    
}