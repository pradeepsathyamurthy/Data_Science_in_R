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

#complete("specdata", 1)
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
