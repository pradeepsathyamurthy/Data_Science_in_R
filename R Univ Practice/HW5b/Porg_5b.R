######################################################################################
# Author: Pradeep Sathyamurthy
# Date: 23-May-2017
# Course: CSC-433
# Guiding Prof: Prof. Steve Jost
# Project: Project-5b
# Dataset Name: states-files.zip
# Variable of Interest for Project-3: State, Rank, City and Population
# Function-1:
# Function-2: 
# This is an R Program used to read through the file and create a complete data frame
######################################################################################

#setwd("D:/Courses/Coursera/Data_Science_in_R/R-Univ Practice/HW5b/states-files")
setwd("C:/datasets/states-files") # as per CSC-433 HW submission standard

# Part-1: Function to read data and sisplay in a dataframe
readStateData <- function(state_file_name){
    setClass("num.with.commas")
    setAs("character", "num.with.commas", function(from) as.numeric(gsub(",", "", from) ) )
    data.state <- readLines(state_file_name,n=1)
    data.city <- read.csv(state_file_name, colClasses = c('numeric','character','num.with.commas'), skip = 1, header=FALSE, sep = ",")
    colnames(data.city) <- c("Rank","City Name","Population")
    #print(data.city)
    return(data.city)
}

# Part-1 extra work: Print along with state name and also handles few dataset that has , as thousands separator
readStateData_with_state <- function(state_file_name){
    data.state <- readLines(state_file_name,n=1)
    data.state.repeat <- rep(data.state, 10)
    data.city <- read.csv(state_file_name, colClasses = c('character'), skip = 1, header=FALSE, sep = ",")
    if(ncol(data.city)>3){
        data1 <- paste(data.city[,3],data.city[,4],sep="")
        data.city[3] <- data1
        data.city[4] <- NULL
    }
    data.state.city.population <- cbind(data.state.repeat,data.city)
    colnames(data.state.city.population) <- c("State","Rank","City Name","Population")
    return(data.state.city.population)
}

# Function call needs to be made atleast once in order to use it in write.table when used inside loop
readStateData("state16.txt")
readStateData_with_state("state16.txt") # This new function is needed to handle the extra comma used as thousand separator in data file like state16.txt

# Part-2: Reading all 50 files and printing only city informations in list
biglist = NULL
name <- "state"
file_extn <- ".txt"
for(i in 1:50) {
    # Create statename using the paste function
    statename <- paste(name,i,file_extn,sep = "")
    biglist[[i]] <- readStateData(statename)
    write.table(biglist[[i]], row.names=F, col.names=F, sep="\t\t\t")
}


# Part-2 extra work: Reading all 50 files and printing state,city informations in list
# And also treating the population data where , is used for thousand separators in some data set (e.g.state16.txt)
biglist = NULL
name <- "state"
file_extn <- ".txt"
for(i in 1:50) {
    # Create statename using the paste function
    statename <- paste(name,i,file_extn,sep = "")
    biglist[[i]] <- readStateData_with_state(statename) 
    write.table(biglist[[i]], row.names=F, col.names=F, sep="\t\t\t")
}
