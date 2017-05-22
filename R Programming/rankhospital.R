###########################################################################################################
# Name: Pradeep Sathyamurthy
# Date of submission: 16 - Oct - 2016
# Problem statement: Working with Hospitality data
############################################################################################################

setwd("D:/Courses/Coursera/R")
data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE )

# defining the function for hospital ranking
rankhospital <- function (state,outcome,rank){
    
    # Setting sample data, wil be deleted
    #state <- "MD"
    #outcome <- "heart attack"
    #rank <- "worst"
    
    # Read the data
    validating_col <- c(2,7,11,17,23)
    data.needed <- data[,validating_col]
    #str(data.needed)
    names(data.needed) <- c("Name","State","DR_Heart_Attack","DR_Heart_Failure","DR_Pneumonia")
    
    # Check that state and outcome are valid
    valid_states <- unique(data.needed[,2])
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
        if(outcome == i){
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
    
    # Heart Attack
    if(outcome=="heart attack"){
        #print(outcomes)
        data.validate.rank <- data.needed[which(data.needed$State==state),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$DR_Heart_Attack,data.validate.rank.clean$Name),]
        data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(rank)=="character"){
            if(rank == "worst"){
                rank.max <- max(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.max),]
                return(result$Name[1])
            }else if(rank == "best"){
                rank.min <- min(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.min),]
                return(result$Name[1])
            }else{
                print("Type a valid value for rank [Number]/worst/best")
            }
        }else if(class(rank)=="numeric"){
         rank.max <- max(data.validate.rank.clean$RANK)
         if(rank>rank.max){
             return("NA")
         }else{
             result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank),]
             return(result$Name[1])
         }
        }
    }
    

    # Heart Failure
    if(outcome=="heart failure"){
        #print(outcomes)
        data.validate.rank <- data.needed[which(data.needed$State==state),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$DR_Heart_Failure,data.validate.rank.clean$Name),]
        data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(rank)=="character"){
            if(rank == "worst"){
                rank.max <- max(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.max),]
                return(result$Name[1])
            }else if(rank == "best"){
                rank.min <- min(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.min),]
                return(result$Name[1])
            }else{
                print("Type a valid value for rank [Number]/worst/best")
            }
        }else if(class(rank)=="numeric"){
            rank.max <- max(data.validate.rank.clean$RANK)
            if(rank>rank.max){
                return("NA")
            }else{
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank),]
                return(result$Name[1])
            }
        }
    }
    
    
    # pneumonia
    if(outcome=="pneumonia"){
        #print(outcomes)
        state="TX"
        rank=10
        data.validate.rank <- data.needed[which(data.needed$State==state),]
        data.validate.rank.clean <- data.validate.rank[order(data.validate.rank$DR_Pneumonia,data.validate.rank$Name),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank[order(data.validate.rank$DR_Pneumonia,data.validate.rank$Name),]
        #data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$DR_Pneumonia,data.validate.rank.clean$Name),]
        data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(rank)=="character"){
            if(rank == "worst"){
                rank.max <- max(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.max),]
                return(result$Name[1])
            }else if(rank == "best"){
                rank.min <- min(data.validate.rank.clean$RANK)
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank.min),]
                return(result$Name[1])
            }else{
                print("Type a valid value for rank [Number]/worst/best")
            }
        }else if(class(rank)=="numeric"){
            rank.max <- max(data.validate.rank.clean$RANK)
            if(rank>rank.max){
                return("NA")
            }else{
                result <- data.validate.rank.clean[which(data.validate.rank.clean$RANK==rank),]
                return(result$Name[1])
            }
        }
    }
}

# train
rankhospital("TX", "heart failure", 4) #DETAR HOSPITAL NAVARRO
rankhospital("MD", "heart attack", "worst") #HARFORD MEMORIAL HOSPITAL
rankhospital("MN", "heart attack", 5000)# NA

# test
rankhospital("NC", "heart attack", "worst") # WAYNE MEMORIAL HOSPITAL
rankhospital("WA", "heart attack", 7) # YAKIMA VALLEY MEMORIAL HOSPITAL
rankhospital("TX", "pneumonia", 10) # SETON SMITHVILLE REGIONAL HOSPITAL
rankhospital("NY", "heart attack", 7) # BELLEVUE HOSPITAL CENTER
debug(rankhospital)


