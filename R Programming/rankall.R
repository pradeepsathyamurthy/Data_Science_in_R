###########################################################################################################
# Name: Pradeep Sathyamurthy
# Date of submission: 16 - Oct - 2016
# Problem statement: Working with Hospitality data
############################################################################################################

setwd("D:/Courses/Coursera/R")
data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE )

# defining the function for hospital ranking
rankall <- function (outcome,num="best"){
    
    # Setting sample data, wil be deleted
    #state <- "MD"
    #outcome <- "heart attack"
    #rank <- "worst"
    
    # Read the data
    validating_col <- c(2,7,11,17,23)
    data.needed <- data[,validating_col]
    #str(data.needed)
    names(data.needed) <- c("Name","State","DR_Heart_Attack","DR_Heart_Failure","DR_Pneumonia")
    
    # Check that outcome is valid
    
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
        
        data.validate.rank <- data.needed[order(data.needed$State,data.needed$DR_Heart_Attack,data.needed$Name),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$State,data.validate.rank.clean$DR_Heart_Attack,data.validate.rank.clean$Name),]
        #data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(num)=="character"){
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
    
    
    # heart failure
    if(outcome=="heart failure"){
        #print(outcomes)
        
        data.validate.rank <- data.needed[order(data.needed$State,data.needed$DR_Heart_Failure,data.needed$Name),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$State,data.validate.rank.clean$DR_Heart_Attack,data.validate.rank.clean$Name),]
        #data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(num)=="character"){
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
        
        data.validate.rank <- data.needed[order(data.needed$State,data.needed$DR_Pneumonia,data.needed$Name),]
        data.validate.rank.clean <- na.omit(data.validate.rank)
        data.validate.rank.clean <- data.validate.rank.clean[order(data.validate.rank.clean$State,data.validate.rank.clean$DR_Heart_Attack,data.validate.rank.clean$Name),]
        #data.validate.rank.clean$RANK <- seq_len(nrow(data.validate.rank.clean))
        if(class(num)=="character"){
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

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital) # Castle medical centre

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital) # BERGEN REGIONAL MEDICAL CENTER

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital) # RENOWN SOUTH MEADOWS MEDICAL CENTER


