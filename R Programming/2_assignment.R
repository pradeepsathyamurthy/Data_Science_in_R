#########################################################################################
#########################################################################################
# Assignment Week-2: Functions and Control Structures                                   #
#########################################################################################
#########################################################################################

# Downloading a data set and unzipping it to a directory called specdata
dataset_URL <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_URL)
unzip("rprog_data_specdata.zip",exdir = "specdata")
list.files("specdata")
# nrow(read.csv("specdata/001.CSV"))

#########################################################################################
# Part-1: Creating function 'pollutantmean' 
#########################################################################################
# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. The function 'pollutantmean' takes three arguments:
# 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads 
# that monitors' particulate matter data from the directory specified in the 'directory' argument 
# and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
#########################################################################################

pollutantmean <- function(directory, pollutant, id){
    
    files_full <- list.files(path = directory, full.names = TRUE)
    data.append <- data.frame()
    for(i in id){
        data.append <- rbind(data.append,read.csv(files_full[i]))
    }
    print(nrow(data.append))
    if(pollutant=="sulfate"){
        
        sulphate.mean <- mean(data.append$sulfate,na.rm = TRUE)
        print(sulphate.mean)
        
    }else{
        
        nitrate.mean <- mean(data.append$nitrate,na.rm = TRUE)
        print(nitrate.mean)
    }
    
}


pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)


#########################################################################################
# Part-2: Creating function 'complete' 
#########################################################################################
# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first column is
# the name of the file and the second column is the number of complete cases. A prototype of this 
#function follows 
#
# OMG, believe me this stringsAsFactors argument in data frame is really very critical
#########################################################################################

complete <- function(directory,id){
    
    file.list <- list.files(path = directory, full.names = TRUE)
    data.complete <- data.frame()
    for(i in id){
        data.complete <- rbind(data.complete,read.csv(file.list[i]))
    }
    good <- complete.cases(data.complete)
    data_comple_good_case <- data.complete[good,]
    #data.final.frame <- data.frame(id="0",nobs="0",stringsAsFactors = FALSE)
    data.final.frame <- data.frame()
    for (j in id){
        id <- data_comple_good_case[which(data_comple_good_case[,"ID"]==j),]
        observation <- nrow(id)
        final.data.frame <- data.frame(id=j,nobs=observation,stringsAsFactors = FALSE)
        data.final.frame <- rbind(data.final.frame,final.data.frame)
    }
    print(data.final.frame)
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#########################################################################################
# Part-2: Creating function 'complete' 
#########################################################################################
# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first column is
# the name of the file and the second column is the number of complete cases. A prototype of this 
#function follows 
#
# OMG, believe me this stringsAsFactors argument in data frame is really very critical
#########################################################################################

corr <- function(directory,threshold=0){
    
    file.list <- list.files(path = directory, full.names = TRUE)
    data.complete <- data.frame()
    for(i in seq_along(file.list)){
        data.complete <- rbind(data.complete,read.csv(file.list[i]))
    }
    print(nrow(data.complete))
    good <- complete.cases(data.complete)
    data_comple_good_case <- data.complete[good,]
    print(nrow(data_comple_good_case))
    data.final.frame <- data.frame()
    k<-0
    final.list<-vector(mode="numeric")
    
    for (j in seq_along(file.list)){
        id <- data_comple_good_case[which(data_comple_good_case[,"ID"]==j),]
        if(nrow(id)>threshold){
            cat("j>>>>",j)
            cat("nrow>>>>",nrow(id))
            cat("threshold>>>",threshold)
            data.final.frame <- rbind(data.final.frame,id)
            corr <- cor(data.final.frame$sulfate,data.final.frame$nitrate)
            print(corr)
            k <-k+1
            final.list[k]<-corr
        }
    }
    cat("K>>>",k)
    print(final.list)
}
        

# method-2
corr <- function(directory,threshold=0){
    
    file.list <- list.files(path = directory, full.names = TRUE)
    data.complete <- data.frame()
    final.vector <- vector(mode="numeric")
    k <- 0
    for(i in seq_along(file.list)){
        
        data <- read.csv(file.list[i])
        good <- complete.cases(data)
        data.complete <- data[good,]
        num.rows <- nrow(data.complete)
        cat("num.row>>>",num.rows)
        if(num.rows > threshold){
            cat("i>>>>",i)
            corr.calc <- cor(data.complete$sulfate,data.complete$nitrate)
            cat("corr>>>",corr.calc)
            k <- k+1
            final.vector[k] <- corr.calc
        }
    }
    print(final.vector)
}


    
cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
# 0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
# 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
# 0.0000 -0.0190  0.0419  0.1901

