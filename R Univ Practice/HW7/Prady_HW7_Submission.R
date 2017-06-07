######################################################################################
# Author: Pradeep Sathyamurthy
# Date: 06-June-2017
# Course: CSC-433
# Guiding Prof: Prof. Steve Jost
# Project: Project-7
# Dataset Name: chlor-reads.txt
# This is a R Program which construct the s3 class
######################################################################################

# Problem-1
# Constructor for ChlorReads object
# Create a constructor ChlorReads that inputs the fields:
# id, name, gender, ldl, hdl, and trigl and returns a ChlorReads object
ChlorReads <- function(id_val, name_val, gender_val, ldl_val, hdl_val, trigl_val){
    chlorReadsobject <- list(id=id_val, name=name_val, gender=gender_val, ldl=ldl_val, hdl=hdl_val, trigl=trigl_val)
    class(chlorReadsobject) <- "ChlorReads"
    return(chlorReadsobject)
}

# Problem-2
# Define a print.ChlorReads method that prints a ChlorReads object like this
# > p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)
# > print(p1) 
# ID: 9876  Name: Virgil  Gender: M
# LDL: 248* HDL: 45+  Triglycerides: 148

# LDL 0 to 200 Normal ""
# LDL 200 to 240 Borderline "+"
# LDL 240 and up High Risk "*"

print.ChlorReads <- function(chlorReadsobject){
    if(chlorReadsobject$ldl >= 0 & chlorReadsobject$ldl < 200){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"")
    } else if(chlorReadsobject$ldl >= 200 & chlorReadsobject$ldl < 240){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"+")
    } else if (chlorReadsobject$ldl >= 240){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"*")
    }
    
    if(chlorReadsobject$hdl >= 0 & chlorReadsobject$hdl < 40){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"*")
    } else if(chlorReadsobject$hdl >= 40 & chlorReadsobject$hdl < 60){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"+")
    } else if (chlorReadsobject$hdl >= 60){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"")
    }
    
    if(chlorReadsobject$trigl >= 0 & chlorReadsobject$trigl < 150){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"")
    } else if(chlorReadsobject$trigl >= 150 & chlorReadsobject$trigl < 200){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"+")
    } else if (chlorReadsobject$trigl >= 200){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"*")
    }

    cat("ID:",chlorReadsobject$id,"Name:", chlorReadsobject$name,"Gender:", chlorReadsobject$gender, "\n" ,"LDL:", chlorReadsobject$ldl,"HDL:", chlorReadsobject$hdl,"Triglycerides:", chlorReadsobject$trigl,"\n")
}

#p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)
#print.ChlorReads(p1)

# Problem-3
# Define the method plot.ChlorReads that plots the data in the ChlorReads object like this
plot.ChlorReads <- function(chlorReadsobject){
    
    plotobject <- chlorReadsobject
    x_names <- c("LDL","HDL","Triglycerides")
    footer_notes <- paste("ID:",chlorReadsobject$id,"Name:", chlorReadsobject$name,"Gender:", chlorReadsobject$gender)
    barplot(c(chlorReadsobject$ldl,chlorReadsobject$hdl,chlorReadsobject$trigl), names.arg = x_names,main="ChlorReads Readings",ylim = c(0,300),sub = footer_notes)
    
}
#plot(p1)

# Problem-4
# Define the accessor methods getPatientInfo.ChlorReads and getChloresterol.ChlorReads
# First define the generic methods getPatientInfo and getCholesterol and 
# the default methods getPatientInfo.default and getCholesterol.default. For example:
# getPatientInfo(p1)
# ID   Name   Gender 
# 9876 Virgil M
# getChloresterol(p1)
# LDL HDL Trigl
# 208  45 148

# Generic method
getPatientInfo <- function(chlorReadsobject){
    UseMethod("getPatientInfo",chlorReadsobject)
}

getChloresterol <- function(chlorReadsobject){
    UseMethod("getChloresterol",chlorReadsobject)
}

getPatientInfo.ChlorReads <- function(chlorReadsobject){
    patientInfo <- data.frame(chlorReadsobject[1],chlorReadsobject[2],chlorReadsobject[3])
    return(patientInfo)
}

getChloresterol.ChlorReads <- function(chlorReadsobject){
    chloresterolInfo <- data.frame(chlorReadsobject[4],chlorReadsobject[5], chlorReadsobject[6])
    return(chloresterolInfo)
}

getPatientInfo.default <- function(chlorReadsobject){
    warning("Check the Object passed for patient info")
    return(chlorReadsobject)
}

getChloresterol.default <- function(chlorReadsobject){
    warning("Check the Object passed for Chloresterol info")
    return(chlorReadsobject)   
}

#getPatientInfo(p1)
#getChloresterol(p1)
#getPatientInfo(1)
#getChloresterol("prady")

# Porblem-5: Write an R script that does the following


# Problem-5.a: Tests the methods defined in 1 through 4

p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)  # <- Testing problem-1
class(p1) # <- Testing problem-1

print(p1) # <- Testing problem-2

plot(p1) # <- Testing problem-3

getPatientInfo(p1)  # <- Testing problem-4
getChloresterol(p1) # <- Testing problem-4
getPatientInfo(1) # <- Testing problem-4
getChloresterol("prady") # <- Testing problem-4

# Problem-5.b

setwd("D:/Courses/Coursera/Data_Science_in_R/R Univ Practice/HW7")
lst <- NULL
chlor <- read.table("chlor-reads.txt",header = TRUE)
for(i in 1:nrow(chlor)) {
    lst[[i]] <- ChlorReads(chlor[i, ]$id, as.character(chlor[i, ]$name),
                           as.character(chlor[i, ]$gender), chlor[i, ]$ldl,  
                           chlor[i, ]$hdl, chlor[i, ]$trigl)
}

# Problem-5.c
# Uses a for loop to print all of the ChlorReads objects in lst
for(j in 1:length(lst)){
    print(lst[[j]])
}

# Problem-5.d
# Uses a for loop to plot all of the ChlorReads objects in lst to a PDF file
pdf("proj7SathyamurthyPradeep.pdf")
for(k in 1:length(lst)){
    plot(lst[[k]])
}
dev.off()



