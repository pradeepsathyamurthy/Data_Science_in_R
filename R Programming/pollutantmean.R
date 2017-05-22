#########################################################################################
# Part-1: Creating function 'pollutantmean' 
#########################################################################################
# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. The function 'pollutantmean' takes three arguments:
# 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads 
# that monitors' particulate matter data from the directory specified in the 'directory' argument 
# and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
#########################################################################################

pollutantmean <- function(directory, pollutant, id=1:332){
    
    files_full <- list.files(path = directory, full.names = TRUE)
    data.append <- data.frame()
    for(i in id){
        data.append <- rbind(data.append,read.csv(files_full[i]))
    }
    if(pollutant=="sulfate"){
        
        sulphate.mean <- mean(data.append$sulfate,na.rm = TRUE)
        print(sulphate.mean)
        
    }else{
        
        nitrate.mean <- mean(data.append$nitrate,na.rm = TRUE)
        print(nitrate.mean)
    }
    
}


#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "sulfate", 1:10) # 4.064
pollutantmean("specdata", "nitrate", 70:72) #1.706
pollutantmean("specdata", "sulfate", 34) #1.477
pollutantmean("specdata", "nitrate") #1.703