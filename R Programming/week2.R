############################################
############################################
# Practice of R Week-2                     
############################################
############################################

# Our focus in this week is on control stuctures

setwd("D:/Courses/Coursera/R")
getwd()

########################################
# if - elseif - else 
########################################
# R has similar coding stadards of C language
x <- 7
if(x>8) {
  y <- "Greater than 7"
} else if(x<6){
    y <- "Less than 7"
} else {
  y <- "Value is 7"
}
print(y)

# writing in a different way

y <- if(x>5){
  10
}else{y <- 0}
print(y)


########################################
# for loop
########################################

# Mostly commenly used for iteration over elements in a objects like vector and list
# it follows a python standard
for(i in 1:10){
  print(i)
}

x <- 1:6
for(i in x){
  print(x[i])
}

# Usage of seq_along() function
# Genrate a sequence based on x length

for(i in seq_along(x)){
  print(x[i])
}


########################################
# Nested For loop
########################################
# restrict nesting of for loop to not more than 2, alternatively use functions

mat1 <- matrix(1:6,nrow=2,ncol=3)

for(i in seq_len(nrow(mat1))){
  for(j in seq_len(ncol(mat1))){
    print(mat1[i,j])
  }
}

########################################
# while loop
########################################

x <- 0
while(x<6){
  print("Value of x now is")
  print(x)
  x <- x+1
}

########################################
# repeat loop
########################################
# This is a define infinte loop
# It starts with a infinite loop and to exit we need to use break statements
# Generally not used in statistical studies, however look into this later


########################################
# next and break
########################################
# next can be corelated to continue in python, it will skip an iteration happening
# break is also same as python, is to exit a loop
x <- c(1:20)
for(i in x){
  if(i<=10){
    print(i)
    break
  }
  print(i)
}

########################################
# Summary of control structures
########################################

# control structures like if, while and for allow to control the program structure
# infinite loops need to be generally avoided
# look into apply function and its usage

help("cat")
cat("hi value of x is>>>",x)


# Intro
# We saw about the control structures used to tweak the flow of a program execution
# THere are basically these control structures used in most of the programs and so in R as well
# 1. if-else
# 2. for loop
# 3. while loop

# if-else
x <- 10
if (x > 10){
    y <- 11
} else if(x < 10){
    y <- 9
} else{
    y <- 10
}
cat("value of Y is >>>> ",y)

# for loop
x <- c("a","b","c","d","e")
for (i in x){
    print(i)
}

m <- matrix(1:6,nrow = 2,ncol = 3)
for(i in seq_len(nrow(m))){
    for(j in seq_len(ncol(m))){
        print(m[i,j])
    }
}

# While loop
y <- 0
x <- 0
while(x<10){
    y <- y+1
    print(y)
    x <- x+1
}

# Next and break statement
y <- 0
x <- 0
while(x<10){
    if(x==5){
        x <- x+1
        y <- y+1
        next
    }else if (x==10){
        break
    }else{
        print(y)    
    }
    y <- y+1
    x <- x+1
}

# After this we saw about the functions in R
# These are blocks of small programs designed to perform some desired function in R
# There are inbuit functions like cat(), print(), lm(), mean(), etc.,
# In addition to this there are functions released by developer community with various packages like read_csv()
# In addition to this user can code his own functions which are internal to his project or organization
# Functions can be with and without arguments
# Argumennts in R are Lexical/Static variables and are not Dynamic in nature
# We need to know the scope of arguments and accordingly use it in our programs
# Envirinment search priority: 1. .GlobalEnv - environment we use, 2. package:knitr, 3. package:stat
# 4. package: Graphics, 5. package: grDevices, 6. packages: utils, 7. packages: datasets, 8. Autoloads, 
# 9. packages: base
search()
# When user adds a package explicitly, then it will get added as 2 priority after GlobalEnv and rest of the packages
# priority gets shifted accordingly
# Value of free variable are searched in the environment in which the funciton is defined
# Function + Environment = Closure or function closure


# Simple function without arguments
add <- function(){
    x <- 1
    y <- 2
    z <- x+y
    cat("Sum of 1 and 2 is>>>",z)
}

# Simple function with arguments
subb <- function(x=0,y=0){
    sub_value <- x - y
    cat("Difference between ",x,"and ",y,"is>>>> ",sub_value)
}

# Function are one of the base object with class as functions
# This means it can be used as various other base class in program
# We can pass it as argument or use a nested function

# Calling a function without argument
add()

# Calling a function with argument by passing values
subb(5,6)

# Calling a function with argument by not passing values
subb(1,2)

############################################
############################################
# Practice of R Week-2 from  prof                    
############################################
############################################

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
# refer this link http://adv-r.had.co.nz/Functionals.html
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data")

andy <- read.csv("diet_data/Andy.csv")
head(andy)
length(andy$Day)
dim(andy)

str(andy) # Displays complete structure of an R object
summary(andy)
names(andy)

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

andy_loss <- andy_start - andy_end
andy_loss

files <- list.files("diet_data")
files[1]
files[2]
files[3:5]
head(read.csv(files[3]))
files_full <- list.files("diet_data",full.names = TRUE)

head(read.csv(files_full[3]))

andy_david <- rbind(andy, read.csv(files_full[2]))

head(andy_david)

# Applying filterin the collumn
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

dat <- data.frame()
for(i in 1:5){
    dat <- rbind(dat, read.csv(files_full[i]))
    
}

median(dat$Weight,na.rm = TRUE)

dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

weightmedian <- function(directory, day)  {
    files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
    dat <- data.frame()                             #creates an empty data frame
    for (i in 1:5) {                                
        #loops through the files, rbinding them together 
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
    median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
    #while stripping out the NAs
}

weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)

# OPtimized way to create a data frame such that RAM is not much occupied

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

for (i in seq_along(files_full)) {
    tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

str(lapply(files_full, read.csv))

str(tmp[[1]])
head(tmp[[1]][,"Day"])

output <- do.call(rbind, tmp)
str(output)

help("POSIXct")

#########################################################################################
#########################################################################################
# QUiz Solition for week-2: imporant for lexical scoping                                #
#########################################################################################
#########################################################################################


# Quest-1
cube <- function(x, n) {
    x^3
}

cube(3)

# Quest-2
x <- 1:10
if(x > 5) {
    x <- 0
    print(x)
}

# Quest-3

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z <- 10
f(3)

# quest-4

x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}
print(y)

# quest-5

h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
    if(d == 3L)
        return(g)
    g <- g + 10
    g
}

# quest-6
help("environment")

# Quest-7
# free variables are defined by lexical variable

# quest-8
# about the free varibale and global environment



