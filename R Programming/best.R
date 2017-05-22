###########################################################################################################
# Name: Pradeep Sathyamurthy
# Date of submission: 16 - Oct - 2016
# Problem statement: Working with Hospitality data
############################################################################################################

setwd("D:/Courses/Coursera/R")
outcome <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE )
head(outcome)
ncol(outcome) #46 collum
nrow(outcome) #4706 rows
str(outcome)

# Problem-1
# to plot the distribution of:
# Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the risk adjusted rate (percentage) for each hospital
# this is variable 11 in above data
str(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])
# Because we originally read the data in as character (by specifying colClasses = "character" we need to
# coerce the column to be numeric. You may get a warning about NAs being introduced but that is okay.


# Problem-2
# Finding the best hospital in the state
# input args: 7-State, (heart attack,heart failure, pneumonia)
# Validation cols: 11, 17, 23
# Return col: vector of col 2
# Handling Tie: Arrange based on alphabatical order
# Handle: "invalid state" and "invalid outcome"

best <- function(state,outcomes){
    
    # Read the data
    validating_col <- c(2,7,11,17,23)
    data.best <- outcome[,validating_col]
    data.best[,1] <- as.character(data.best[,1])
    data.best[,2] <- as.character(data.best[,2])
    data.best[,3] <- as.numeric(data.best[,3])
    data.best[,4] <- as.numeric(data.best[,4])
    data.best[,5] <- as.numeric(data.best[,5])
    
    # Check that state and outcome are valid
    valid_states <- unique(data.best[,2])
    valid_outcome <- c("heart attack","heart failure","pneumonia")
    for(i in valid_states){
        if(state == i){
            #print("valid state")
            j <- 1
            break
        }else{
            #print("invalid State")
            j <-0
        }
    }
    
    if(j==1){
        print("Valid State")
    }else{
        stop("invalid state")
    }
    
    for(i in valid_outcome){
        if(outcomes == i){
            #print("valid outcome")
            k <- 1
            break
        }else{
            #print("invalid outcome")
            k<-0
        }
    }
    
    if(k==1){
        print("Valid outcome")
    }else{
        stop("invalid outcome")
    }
    
    # Return the hospital Name in that state with lowest 30 days death rate
    
    # Heart Attack
    if(outcomes=="heart attack"){
        #print(outcomes)
        data.validate.hosp <- data.best[which(data.best$State==state),]
        data.validate.hosp.clean <- na.omit(data.validate.hosp)
        mini <- 0
        for(i in data.validate.hosp.clean[,3]){
            if((mini==0) || (i < mini)){
                #print(i)
                mini <- i
            }
        }
        print(mini)
        result <- data.validate.hosp.clean[which(data.validate.hosp.clean$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==mini),]
        return(sort(result$Hospital.Name,decreasing = FALSE)[1])
    }
    
    # heart failure
    if(outcomes=="heart failure"){
        #print(outcomes)
        data.validate.hosp <- data.best[which(data.best$State==state),]
        data.validate.hosp.clean <- na.omit(data.validate.hosp)
        mini <- 0
        for(i in data.validate.hosp.clean[,4]){
            if((mini==0) || (i < mini)){
                #print(i)
                mini <- i
            }
        }
        print(mini)
        result <- data.validate.hosp.clean[which(data.validate.hosp.clean$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==mini),]
        return(sort(result$Hospital.Name,decreasing = FALSE)[1])
    }
    
    # pneumonia
    if(outcomes=="pneumonia"){
        #print(outcomes)
        #state="AK"
        data.validate.hosp <- data.best[which(data.best$State==state),]
        data.validate.hosp.clean <- data.validate.hosp[order(data.validate.hosp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,data.validate.hosp$Hospital.Name),]
        mininin <- min(data.validate.hosp.clean[,5],na.rm=TRUE)
        # print(mininin)
        result <- data.validate.hosp.clean[which(data.validate.hosp.clean$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==mininin),]
        return(sort(result$Hospital.Name,decreasing = FALSE)[1])
    }
    
}

head(outcome)
debug(best)
# Train
best("TX","heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
# Test
best("SC", "heart attack") #MUSC MEDICAL CENTER
best("NY", "pneumonia") # MAIMONIDES MEDICAL CENTER
best("AK", "pneumonia") # YUKON KUSKOKWIM DELTA REG HOSPITAL

