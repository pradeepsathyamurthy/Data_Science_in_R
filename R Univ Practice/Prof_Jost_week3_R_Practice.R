# R Learning from week-6 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24, 2017
# Topics Discussed: control structures, if..else, do...while, for and nested for

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
