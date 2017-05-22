####################################################################
# Author: Pradeep Sathyamurthy
# Course: Data Science-1 Practicing R
# Date: 1 Dec 2016
####################################################################

############################################
# Practice of R Week-1                     #
############################################

# # - Is used for commenting, R has no multiline comments for block commenting

# Getting and settin up the working directory
getwd()
setwd("D:/Courses/Coursera/R")

########################################
# Input the data, that is data assigning
########################################
x <- 1 # <- used to assign values, yeah it is irritating. However, no choice
y <- "Prady" # When assigning a string use always the "" else it will consider it as an object

########################################
# Evaluation - Vector representation
########################################
z <- 11:30  # Here we are trying to define a vector of length 19
z # This is called auto printing of object and used for interactive environments
print(z) # Explicit printing, Used in Programming environment for scripts, functions and long program
print(y) # Printing normally happens with indexing, Actual object and the way it gets printed with indexing is diff

########################################
# Objects - There is no variable concepts here, R sees everything as an object

# 5 Basic/atomic Classes of Objects - Character, Numeric, integer, complex and logical
# Vector - Most used object is Vector Object, it can contain only objects of same classes
# List - However, list object is a vector object with different classes, mainly used by data engineers
# Raw - Raw object not commenly used by data engineers mostly, we will not cover this here
########################################

# Numbers
x <- 1 # X is a numeric object [1 and not 1.0]. However, internally it gets stored as integer 1.0
x <- 1L # To store X explicitly as Numeric object then use L with the number, obj itself will be numeric
0/0 # NaN is a speacial number object which can be used for missing values in data if needed
1/0 # Inf is another number object to define infinity

# Attributes
# When there is an object, it must have its attributes. e.g. Car object has various attributes like color, stroke, horse power, etc.,
# Normally these attributes are not for basic object discusses above, but used for dataframes
# Few Attributes are Name, dimnames
# dimensions (matrix and arrays)
# class (integers, numeric)
# length
# other user defined attributes and metadata
# Attributes of an object can be accessed using attributes() function
attributes(x) # When an object has no attributes, it will return NULL

#####################################################################################################
# Vector and list c() is used - Very very very Very very very Very very very Very very very Important
#####################################################################################################
x <- c(0.3,0.7,1.2) # use c() to define a vector, may be c denoted collumn in short :P
y <- c(1,"prady",TRUE) # as discussed, vector object must be of same class, else R will automatically convert them accordingly, this is called implicit coercion
typeof(y) # typeof()/class() function can be used to find the type of vector object used in a program

x <- c(0.3,0.2,0.9) # Numeric
x <- c(TRUE,FALSE) # Logical to be used formally
x <- c(T,F) # Logical, not used formally but when lazy :P
x <- c("a","f","R") # charater
x <- 9:21 # Integer
x <- c(1+0i,4+2i) # Complex Numbers
x <- vector("numeric",length=10) # use explicit vector() funtion to define a vector
help("vector") # use help function to learn about any new functions to know about it

# Explicit coersion
x <- 1:12 # This creates a integer class
class(x) # Class() function can be used to cross validate it
as.numeric(x) # This is explicit coersion. However, actual object class stay in tact
as.logical(x)
as.complex(x)
x <- c("a","c","e")
as.numeric(x) # When doing wrong coersion, warning is thrown by R, this is a caution for us

# As discussed above list is a speacial vector which can hold object of different class
x <- list(1,"a",TRUE,1+4i)
class(x)
x <- vector(mode="list",length = 5) # This is used to create an empty list, must pass two arguments with names

########################################
# Matrices - matrix(), dim(), attributes(), rownames(), colnames()
########################################

m <- matrix(nrow = 2,ncol = 3) # matrix() used to create matrix, this will create a empty matrix
dim(m) # These are various attributes, dim() used to find the dimension
attributes(m) # In order to know all the attributes associated to a function use attributes(), will list all necessary attributes

# Matrix in R is consructed collumn wise as it is consideres as vector with dimentions
m <- matrix(1:6,nrow=2, ncol=3) # Defining a range of values
m <- 1:10
dim(m) <- c(2,5) # Note that number of values must rightly fill the placeholders in matrix
n <- 1:11
dim(n) <- c(2,5) # This will throw error as dimention of n does not match with the length of the obj
x <- 1:3
y <- 11:13
cbind(x,y) # This will bind above two vector by collum wise
rbind(x,y) # This will bind above two vector by row wise
x <- 1:4
y <- 11:13
cbind(x,y) # Again if the values of two vector cannot fit the matrix space error will be thrown


########################################
# Factors & Class - These are used to represent the categorical ordinal variables, factor()
########################################

x <- factor(c("yes","no","no","yes","no")) # This will create a factor or convert a vector to a factor
x # Factor can print the actaul values and levels in that particular variable
table(x) # This will give a result like a confusion matrix but only with actual value
unclass(x) # This will show a catgorical variable in a numeric format

x <- factor(c("yes","no","no","yes","no"))
x # by defaul level is set in a alphabatical order
x <- factor(c("yes","no","no","yes","no"),levels = c("yes","no")) # We have changed the levels, this is important in doing regression for categorical variables


########################################
# Missing Values - NA and NaN - is.na(), is.nan()
########################################

x <- c(1,3,5,1,NA,56,98)
is.na(x) # Used to test if the object is NA and it also has its class integer NA, Char NA
x <- c(1,3,5,1,NaN,56,98)
is.nan(x) # Used to test if the object is NaN, but it has no class associated to it
x <- c(1,3,5,1,NA,NaN,56,98)
is.na(x) # is.na captures both NA and NaN
is.nan(x) # is.nan captures only NaN


########################################
# Data Frames - Used to store tabular data - data.frame(), names(), row.names()
########################################

# Used to store tabular data in R, dplyr very important package to learn
# It is a special type of list, every element of the list have same length
# Element if the list = Collum, Length of each element = rows
# Unlike matrices, data frame can store diff class of objects
# In addition to collum name there is a row.name functionality in data frame
# Data frames are created through read.table(), read.csv() and can be newly created with data.frame()
# Can be converted to matrix by data.matrix(), always used data.matrix instead of as.matrix()

x <- data.frame(foo=1:4,bar=c(T,T,F,F)) # Creating data frame
nrow(x) # Used to find the number of rows are length of elements
ncol(x) # Used to find the number of collumns or elements in a data frame


########################################
# Names Attributes - names() used to create labels for a object
########################################

x <- c(1:3) # We just created a integer object
names(x) # there is no name associated and hence will return NULL
names(x) <- c("Col-1","Col-2","Col-3")
x # This will assign labels to integer object created

x <- list("Col-1"=1,"col-2"=2,"col-3"=3)
x

m <- matrix(1:4,nrow=2, ncol = 2) # In Matrix we can name both collum and rows, in list its not possible
dimnames(m) <- list(c("a","b"),c("c","d"))

rownames(m) <- c("e","f")
colnames(m) <- c("g","h")

########################################
# Summary
########################################

# Names attributes are very important in data frame
# Dimention attributes are also equally important

########################################
# Reading Tabular Data
########################################

data1 <- read.table("sample_table.txt") # Try to use colClasses arg, it will make the read 2X faster
read.csv() # Same as read.table function, just that the parameter for sep argument is different
help("read.table")


########################################
# Reading Large Tables - use of readr package - main functions are read_table() and read_csv()
########################################

read_csv(col_types="cc") #like colClasses, col_types is used to read the file faster, cc implies char char
read_table() # same as read_csv
cols_only() # Used to select one particular collum
# lubridate package 

########################################
# Textual Data Formats
########################################

dump() # Resulting textual data is editable and it preserves metadata
y <- data.frame(a=1,b="a")
dput(y) # Will provide an output in the form of R code, implies it preserves the metadata
help("dput")
deput(y, file="eg_deput.R")

save() # Saves the data objects to a file
load() # load a data object into R work space
save.image() # Save everything to a file
serialize() # Convert individual R object to a binary format and then passed on through any arbitrary connections, it is a raw vector in exadecimal format
# Better to use save() instead of serialize()
# If we need to export an R object with intact meta data serialize is a serious option

########################################
# Connections: Interfaces to outside world
########################################

file() # Function used to establish explicit connection to a file
con <- file("foo.txt")
open(con,"r")
data <- read.csv(con)
gzfile() # used to open a zip file
readLines() # used to read text file that are unstructured or contain no standard data
url() # to read from URL

########################################
# Subsetting - Basics - Split the object or to get the subset of an object [, [[, $
########################################
# [ = Return an object of same class, used to select multiple element of an object
# [[ = Used to extract elements of list or data frame. Used to extract only single element
# $ = used to extract elements of list or data frame by literal name. Semantics are similar to [[


########################################
# Subsetting - Vector
########################################

x <- c("a","b","c")
x[1] # Extracting the first element of object x
x[3] # Extracting the third element of object x
x[4] # This will reurn a NA value

x[1:3] # Extract multiple elements from index 1 to 3
x[c(1,3)] # Extracting by specifying the vector definition of the index

x[x>"a"] # Extracting Lexographically


########################################
# Subsetting - List
########################################

x <- list(foo=1:4,bar=0.6)

x[[1]] # Used to extract single element from list
x$foo # mostly Used to extract element by name

# [[ used only with computed index. $ needs object label
x <- list(foo=1:4,bar=0.6)
name <- "foo"
x[[name]]
x$name # This will give NULL value


########################################
# Subsetting - Matrices - Splitting matrix with i,j
########################################

m <- matrix(1:6, nrow = 2, ncol = 3)
m[1,1] # first row first collum i=1; j=1
m[1,3] # first row third collum i=1; j=3
m[2,3] # second row third collum i=2; j=3

m[,1] # Entire row of 1st collum
m[2,] #Second Row and entire collum

m[1,1,drop= FALSE] # Extract the subset in a matrix form
m[,2,drop = FALSE] # Extract the subset in a matrix form, we say not to drop the dimention details while printing the data

# Subsetting Nested Element of a list [[ is used

x <- list(a=list(10,12,14),b=c(3.12,2.19))
x[[c(1,3)]] # Getting third element of the first object
x[[1]][[3]] # Same as above getting third element of the first object
x[[c(2,1)]] # Fist element of the second object

# Extracting multiple elements of a list

x <- list(foo=1:4,bar=0.6,baz="hello")
x[c(1,3)] #Extract complete 1st and 3rd object
# [ will always return an object of same class as original
# Since original object was a list, [ returns a list in above code, we returned list with 2 elements 1st and 3rd


########################################
# Subsetting - Partial Matching - [[ and $ useful during the interactive work when object name is very large
########################################
x <- list(aardkkjda=1:5)
x$a # R automatically shorten the object name
x[["a",exact=FALSE]]
X[["a"]] # This will consider a as an object and will through error

x <- list(aardkkjda=1:5,awerwer=6:9)
x$aa
x$aw


########################################
# Subsetting - Removing Missing Values - removing NA and NaN
########################################

# When presence of NA is less and countable
x <- c(1,2,NA,3,4,NA,8)
bad <- is.na(x)
x[!bad]

# Use of complete.cases
x <- c(1,2,NA,3,4,NA,8)
y <- c(13,NA,51,2,4,NA,2)
good <- complete.cases(x,y) # Be careful, object must be of same size
x[good]
y[good]

# complete.case can also be used in data.frames
head(airquality)
good <- complete.cases(airquality)
head(airquality[good,])

########################################
# Subsetting - Vectorized Operations
########################################

# R is a vectorized language
x <- 1:4
y <- 5:8
z <- x+y # You can do -, * and /
x>2 # Logical operator, returns true or false

# Matrix operations are also vectorized, helps in doing element by element operation when needed
x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)

x*y # Element wise multiplication
x%*%y # True matrix multiplication
x/y

########################################
# Quick overview of Week-1
########################################
# Atomic classes avaiable

x <- 1      #numeric
y <- "prady"  #character/string
z <- 22L     #integer
a <- TRUE     #logical
b <- 2+4i     #complex
class(a)

# Important objects to know

vec1 <- c(1:12) # Vector object, can have elements of same class only
lis1 <- list(1,"prady",FALSE,3+7i) # Can have elements of different class
mat1 <- matrix(1:6,nrow = 3,ncol=2) # Matrix, its a vector with dimension
df1 <- data.frame(foo=1:6,poo=c("TRUE","FALSE","TRUE","FALSE","TRUE","FALSE")) # Data in tabular format
for1 <- factor(c("men","women","women","men"),levels=c("women","men")) # for dummy/categorical variable
table(for1) # to validate factorized data
typeof(lis1) #normally used to study the type of the object

# Subsetting - workouts - it is a method of accessing data in chunks
# it is done using [], [[]] and $

# Subsetting Vector, for this [] operator would do
vec2 <- c(1:13) # Defining a vector
vec2[5:6] # Can subset more than one element from a vector object
vec2[5] # can use to select only one value
#vec2[[5]] # Can subset only one element from a vector object


# Subsetting matrix, even for this [] operator would do
mat2 <- matrix(1:6,nrow=2,ncol=3) # Defining the matrix
mat2[,2] # Selecting only a specific collum
mat2[1,] # Selecting only a specific row
mat2[1,3] # Selecting one specific element from a matrix

# Subsetting list, mostly used is []
lis2 <- list(1,"prady",TRUE,2+4i)
lis2[1:3] #Selecting more than one element from list
lis2[4] #Selecting one element from the list

# Subsetting nested element of list, mostly used is [[]]
lis3 <- list(list("sandy",2,FALSE),c(1:5))
lis3[[1:2]] # used to traverse between the nested list
lis3[1] #select first element of primary list which is again a list and takes its own value
lis3[1:2] # To select more than on element from a list

# Partial Matching, mostly used is $
datfrm1 <- data.frame(foosdjkhfofhshfs=1:6,poojdfiewfsdkh=c(T,F,F,T,T,F),pjdfiewfsdkh=c(F,T,T,F,F,T))
datfrm1$f # We do not need to mention whole object name in list
datfrm1$p # however if a object has  has elements names similar to each other, it will not work
datfrm1$poo #need to use unique identifier

# Removing NA values, profession usage is complete.case() function
nas1 <- c(1,3,65,23,NA,2,NA,2,2,NaN,NA,NA,1,4,2)
miss1 <- is.na(nas1) # method-1
gooddat1 <- nas1[!miss1]
miss2 <- complete.cases(nas1) # method-2, using complete.cases
gooddat2 <- nas1[miss2]
nas2 <- c(11,13,5,7,NA,3,NA,0,1,NaN,NA,NA,9,6,NA)
gooddat3 <- complete.cases(nas1,nas2) # method-3, used to prepare a data set with no missing values
nas1[gooddat3]
nas2[gooddat3]

#########################################################################################
#########################################################################################
# QUiz Solition for week-1: imporant for data selection and slicing                     #
#########################################################################################
#########################################################################################

x <- 4
class(x)
x <- c(4, "a", TRUE)
class(x)
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]]
x <- 1:4
y <- 2
Z <- x+y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]=4
x[x >= 11] <- 4

setwd("D:/Courses/Coursera/R")
data1 <- read.csv("hw1_data.csv")
head(data1)

# 12. first two rows
first_two_row <- data1[1:2,]

# 13. Number of observations
num.obsv <- nrow(data1)

# 14. Last two rows
last_two.rows <- data1[152:153,]

# 15. Value of ozone in 47th row
ozone.value <- data1$Ozone[47]

# 16. number of missing values
ozone.missing <- is.na(data1$Ozone)
table(ozone.missing)

# 17. mean of ozone by excluding na
ozone.good <- data1$Ozone[!ozone.missing]
mean(ozone.good)

# 18. mean of solar where ozone > 31 and temp > 90 >>>>>>>>> Very important
#head(data1)
#com.case <- complete.cases(data1)
#good.data1 <- data1[com.case,]

ozone <- data1$Ozone >31
data1.ozone.31 <- data1[ozone,]

temp <- data1.ozone.31$Temp > 90
data1.temp.91 <- data1.ozone.31[temp,]

solar.na <- is.na(data1.temp.91$Solar.R)
solar.good <- data1.temp.91$Solar.R[!solar.na]
mean(solar.good)

# 19. mean of "Temp" when "Month" is equal to 6

month <- data1$Month ==6
data1.month.6 <- data1[month,]
mean(data1.month.6$Temp)

# 20. Find the maximum ozone value in the month of May
month <- data1$Month ==5
data1.month.5 <- data1[month,]
data1.month.5.ozone <- is.na(data1.month.5$Ozone)
data1.month.5.ozone.good <- data1.month.5$Ozone[!data1.month.5.ozone]
max(data1.month.5.ozone.good)

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

############################################
############################################
# Practice of R Week-3 - Loop Functions                     
############################################
############################################

# Loop Functions are R's inbuilt functions which gives us flexibility to apply a particular function
# to various different basic objects like list, matrix or vector
# Loop Functions that will be discussed as part of this weel are:
# lapply() - for list
# sapply() - for list, result will be simple
# apply() - for arrays
# tapply() - for vectors
# mapply() - for matrix
# We will see each in details now

############################################
# lapply() - Takes 2 main argument with it                     
############################################

# This is used if you need to substitute a function for a list of values
list.1 <- list(a=1:3, b=4:5) # defining a list
lapply(list.1, mean) # applying all elements of list 1 to mean function

# Anonymous function
# We can create a ananymous function, as name signifies, these are functions without name
# They are temporary, stay untill lapply execution and then gets deleted from work space
list.2 <- list(c=1:10,d=12:20)
lapply(list.2,function(x){print(x)})

# Explicit function
f <- function(x){
    print(x)
}
list.3 <- list(c=10,d=20)
lapply(list.2,f)


############################################
# sapply() - Takes 2 main argument with it                     
############################################

# This funtion is same as lapply(). However, return results are well structured based on the arg passed
x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
y <- lapply(x, mean) # This returns a list of 4 element and each list has a list of 1 element
class(y)
z <- sapply(x, mean) # This will return a numeric vector as the retun value is just a vector
class(z)


############################################
# split() - This is the main function you should rely to apply a filter in a dataset                     
############################################
#split() + lapply() and split() + sapply() are very powerful

x <- c(rnorm(10),runif(10),rnorm(10,1)) # Creating a vector
f <- gl(3,10) # Creating a general list
split(x,f) # spliting the dataset based on level
lapply(split(x,f), mean) # applying function on each dataset using the lapply function

# Lets try to see an actual usage of split function using airquality dataset

library(datasets)
data1 <- airquality
head(data1)
table(data1$Month) # trying to identify the different levels
split.data1 <- split(data1,data1$Month) # Splitting the data wrt to one single collumn
# Using sapply() and passing the split datasets and a ananimous function with colMeans method 
# to calculate multiple means, we have also used na.rm to remove all the NA values from the datset
sapply(split.data1, function(x){colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE)})

# interaction() - look in more detail later
# If we need to apply filter on more than one variable we need to use interaction function
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
interaction(f1,f2)
str(split(x,list(f1,f2),drop = TRUE))


# loop function parctice after read through
# lapply, sapply, apply, tapply, mapply

########
# lapply
########
# Used for iterating a function for a list of elements
# For this we first need list, so define it
list.1 <- list(a=1:3,b="prady") # list with two elements, one being a numeric vector and other being string
list.2 <- list(a=1:5,b=6:10) # list with only vertors
# after this we need a function which we want to iterate at times
# creating a function which will just print the argument which it carries
function.1 <- function(x){
    
    print(x)
}
# suppose if i need to iterate list.1 with above function
for(i in list.1){
    function.1(i)
}
# now instead of ths 3 lines of for loop, we can use lapply()
lapply(list.1, function.1)
lapply(list.2, function.1)


########
# sapply
########

# We could see that lapply retuns the o/p in form of a list, this looks ugly
# to make the o/p look good and neat we can use sapply. However, all its furntions are same as lapply
# Only the retun value defers which is a vector

sapply(list.2, function.1) # o/p returned will be in a structured matrix format
sapply(list.1,function.1) # you will see o/p same as lapply, this is because list as elements of diff class

list.3 <- list(a="Prady",b="Sruthi")
sapply(list.3, function.1) # Now since all elements of the list are of same class, o/p is well structured


########
# split
########

# This is an auxillary/supporting function for these lapply and sapply
# These are used to split a data frame based on few condition
# Just like applying filter on a data frame in efficient way, lets do this demo with a inbuilt dataset

data.1 <- airquality
head(data.1) # be carefull this data set is with na values

# suppose you need to filter a data based on Month
data.month.5 <- data.1[which(data.1$Month==5),]
data.month.6 <- data.1[which(data.1$Month==6),]
data.month.7 <- data.1[which(data.1$Month==7),]
data.month.8 <- data.1[which(data.1$Month==8),]
data.month.9 <- data.1[which(data.1$Month==9),]

# Inorder to efficiently reduce above five lines to one single line we can make use of split()
data.split <- split(data.1,data.1$Month) # this will return a list value filtered by month
names(data.split) # we can see the names of the list
data.split[5] # print it as in required

# Above this we can use an sapply function to find mean or sd or whatever required
sapply(data.split, function(x){colMeans(x,na.rm = TRUE)}) #gives mean of all collum for all element in list
sapply(data.split, function(x){colMeans(x[,c("Ozone","Solar.R")],na.rm = TRUE)}) # clac only for a specific collum
# thus split and spply goes hand in hand in make statistical calculations


#############
# interaction - I am not able to understand this
#############

# Now what if we need to apply filter on more than one collum
# interaction() is used
data.split.month <- data.split
data.split.day <- split(data.1,data.1$Day)
interaction(data.split.month,data.split.day)

#############
# tapply
#############

# This is mainly for vector values
# It can be inferred as split + sapply together only for vector input
str(tapply) # thus we need atleast a vector and a factor to use tapply
x <- c(rnorm(1:10,10),rnorm(21:30,10),rnorm(11:20,10)) # Defining a vector
index.1 <- gl(3,10) # Defining a factor
tapply(x, index.1, mean)


#############
# apply
#############

# This is mainly for arrays and mostly used for matrix and if we need to compute values for row/collum
x <- matrix(1:12,nrow = 3,ncol = 4) # Since we need a matrix to use in apply we are defining one
apply(x, 1,mean) # apply mean function to elements in a one single row
apply(x, 2,mean) # apply mean function to elements in a one single collum
# We can use this as per the data we gathered
data.1 <- airquality
apply(data.1,2,mean) #very simple way to compute something
# See how to compute mean when values are NA


#############
# mapply
#############

# This is mainly for matrix
# Iterate across multiple R objects in parallel
# this is like a for loop, but with multiple incrementers i,j,k which can iterate together and get incremented
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
# above code can be simplified to
mapply(rep,1:4,4:1)
# In above code, rep needs two argument, arg1 is a number and arg2 is the number of 
# time it must be repeated
# mapply will apply the first element of the list like argument in  rep and iterate to next element 
# of the list of both arguments, if little confusing first do help for rep and then for mapply u will get it


#########################################################################################
#########################################################################################
# QUiz Solution for week-3: imporant for loop functions                                 #
#########################################################################################
#########################################################################################


# Question-1 - 6.56 - 7
library(datasets)
data1 <- iris
head(data1)
data.split <- split(data1,data1$Species)
names(data.split)
sapply(data.split$virginica, mean)
# or
data.virginica <- data1[which(data1$Species=="virginica"),]
head(data.virginica)
mean(data.virginica$Sepal.Length)

# Question-2
apply(iris[,1:4], 2, mean)

# Question-3

data1 <- mtcars
head(data1)
# calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)
table(data1$cyl) #4,6,8
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg, mtcars$cyl, mean)

# Question-4 - -126.5779 - 127
# what is the absolute difference between the average horsepower of 4-cylinder cars and
# the average horsepower of 8-cylinder cars?

avg.hp <- tapply(mtcars$hp, mtcars$cyl, mean)
class(avg.hp)
avg.hp[1]-avg.hp[3]
as.integer(126.9)

# Question -5
# Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.

#########################################################################################
# <<- operator simplified
#########################################################################################
# To see the difference between <- and <<- we need to first understand the scope of <- 
# Lets define a simple function which takes and argument and inside the function we increment it by 1 and print

f <- function(x){
    
    y <- x +1
    print(x)
    print(y)
}

f(1) # This way we are directly hitting/accessing the function and hence we dwell on to the 'f' function
# We are able to access x and y objects/variables inside this function and R gives complete access to it
environment(f) # this would say your f is in the global environment 

# But once you come out of that function, it means that we are coming out of f's world, so no one knows who is x and y
x # this will also give object not found
y # this will give object not found 
# we now understand the scope of <- with in a function.

# Understanding the scope of <<- in a function

# I am defining a function similar to 'f'. However, inside the function instead of using <- i am using <<-
# So, as part of function g, i am passing an argument and incrementing it with 1 and printing them
g <- function(w){
    
    z <<- w+1
    print(w)
    print(z)
}

g(1) # By executing this, what i do is I create a new function in Global environment and trying to hit/access it
# Once i am inside this function, I am wanting variable Z to be accesss even outside this functional scope and hence using <<-
# With that Z gets created in global environment and it is stored/cached. But if you see carefully w is not been stored in global env

w # this will give object not found error as, this is not available in golbal environment and only scoped inside the function where it is defined
z # However, z will print the value as we have eplicitly stored its value in global environment whose scope of access is more wider
# So the scope of accessing variable y and z in above example is simply called lexical scoping


#########################################################################################
# Sample assignment with cachemean.R explained based on my understanding
#########################################################################################

meanvector <- function(x=numeric()){
    
    m <- NULL
    set <- function(y){
        
        x <<- y
        m <<- NULL
    } 
    
    get <- function() x
    
    setmean <- function(x){
        
        m <<- mean(x)
        
    }
    
    getmean <- function() m
    
    list(set=set,get=get,setmean=setmean,getmean=getmean)
    
}

cachemean <- function(x){ # Declaring a new function to pick the mean value from cache
    
    m <- x$getmean()  # Trying to access the function or environment in which mean is stored
    if(!is.null(m)){  # If loop to check if the value of m is cached or not, if cached it will return its value from cache
        
        message("printing from cache") #Simple message, can be ignored
        return(m) # We need to explicitly return this value to cachemean function
    } # if condition ends
    
    data <- x$get() # Since there is no cached value, we need to calculate mean now, so get the data
    m <- mean(data) # Calculating the mean value and assigning it to m
    x$setmean(m) # Since mean was not cached before, we are caching it now
    return(m) #explicitly returning this newly calculated m to cachemean function, we will have mean by now
} # cachemean function ends


cachemean(meanvector(1:100))
debug(cachemean)
debug(meanvector)

########################################################
########################################################
# Practice of R Week-3 - str, simulations and profiling
########################################################
########################################################

# str function is mostly used to read the elements inside a object in a compact form, similar to summary but in an abstract form
# simulation - You can simulate Random Numbers, Samples and Linear Regression with few functions in R
# profiling - This is about measuring the performance of the code, either we take time stamp or profile the codes to observe the performance

#########################################################
# str() - function used to study an object - one line o/p
#########################################################

str(str) # this says str is a function to which we pass object as one of the mandatory argument
str(lm) # this says lm is a function which accept arguments like formula, data, subset, etc.,
x <- 1:1000
summary(x) # this generally discribe the object x in a statistical form, that is by giving 5 number summary
str(x) # str is similar to summary. However, it descrive he object x generally, saying it is a int with certain values displayed

# For factors
x <- gl(10,3)
summary(x) # this case summary is useful, it displas all levels and in table format
str(x) # this case will explain the object x, saying it is a factor with 10 levels, so based on the need use str and summary functions

# For Datasets
library(datasets)
data <- airquality
head(data)
summary(data) # Used to study the 5 number summary of each collumn
str(data) # Used to study about the collum and few of its values present

# for Matrix
m <- matrix(1:20, nrow = 2, ncol = 10)
summary(m) # Behaves same as dataset, give 5 num summary for each collum
str(m) # Explain the matrix and printing some elements of the matrix

# For split
s <- split(data,data$Month)
summary(s) # Not that useful in case of split function
str(s) # usefull to study the split function based on each class

# Thus based on the information we need about the objects, we can use str and summary accordingly


#########################################################
# simulation - Generating Random Numbers - d   p   q    r
#########################################################

# rnorm, pnorm, dnorm, qnorm

# rnorm - generate random normal variabels
# dnorm - evaluate probablity density for a given vector for a specific mean and SD
# pnorm - evaluate cumilative distribution for a normal distribution
# qnorm - generate quantile random varibales
# defaul mean =0 and sd = 1 for all norm functions
# for dnorm you can evaluate the density, allows to do log density. However, by default false
# for pnorm an qnorm, in addition to mean, sd and log. We can also specify of the  lower tail is T/F, default is TRUE

# rnorm - used to generate simple random variable/numbers
set.seed(1) # always set the seed, this will reset the sequence and generate random numbers
# actualy random numbers are pseudo random numbers, so if you reset the seed, we get same sequence
# Whenever you do random simulations always reset the seed
random.num1 <- rnorm(20)
random.num2 <- rnorm(20,10,2) # Generate a random numbers with mean =10 and SD = 2
summary(random.num2)

#poison Distribution
rpois(10,1)
ppois(2,2)
# read more about poison distribution, cumilative distribution and gamma distribution



#########################################################
# simulation - Simple Linear Model
#########################################################
# y = beta0 + beta1 (x) + error, assume below values
beta0 <- 0.5
beta1 <- 2
x <- rnorm(100)
error <- rnorm(100,0,2) # this is the noise in data
y <- beta0 + beta1*(x) + error
summary(y)
plot(x,y) # thus, is we have the infomraiton of slope and intercepts, we can generate few randome variabels and some noise and test it

# simulating without noise
y <- beta0 + beta1*(x) # if i remove noise it must increase the correaltion
summary(y)
plot(x,y) #shows perfect correlation

# if x being a binary data, we use binomial distribution
set.seed(1)
x <- rbinom(100,1,0.5)
error <- rnorm(100,0,2)
y <- beta0 + beta1*(x) + error
summary(y)
plot(x,y) # thus, shows with noise 

# simulating without noise
y <- beta0 + beta1*(x) # if i remove noise it must increase the correaltion
summary(y)
plot(x,y) #shows perfect 0 or 1 spots

# Generalize linear model 
# try to learn more about poison distribution and come back to this section
set.seed(1)
x <- rnorm(100,0,1)
log.mu <- 0.5 + 0.3*(x)
y <- rpois(100,exp(log.mu))
plot(x,y)


#########################################################
# simulation - Random Samples - sample()
#########################################################

set.seed(1) # used to rest the see in R cache/memory
sample(10) # generate random sample of 10 numbers from 1 to 10, do not repeat
sample(letters,5) # generate randome 5 characters of alphabets
sample(1:10) # Same as generic sample, but at times makes use of permutation in displaying the value
sample(1:20,replace=TRUE) # If we need to repeat the value with in a rang and generate randome number out of it, we can use this

# It is mostly usefull in creating a sample out of a particular dataset
library(datasets)
data1 <- airquality
str(data1) #There are totally 153 observation in which we need to create a train and test dataset
idx <- seq_len(nrow(data1))
set.seed(1)
sample_train <- sample(idx,92)
data_train <- data1[sample_train,]
# Try to split the data into train and test data
# Make sure the data in training data is not presentin the test data
# Make sure it handles the Na and NaN in the data frame

#########################################################
# Summary
#########################################################

# Drawing samples from specific probablity distribution can be done with r*function
# Standard distribution are built in: Normal, Binomial, POisson, Exponential, Gamma, etc., 
# The sample function can be used to draw randome samples from an arbitary vector
# setting random number generator seed through set.seed() is critical to replicate an issue or behaviour in developments


########################################################################################
# R - Profiling - Systematic way to examine time spend in different parts of the program
########################################################################################

# Used to improve the performance of a program code
# Do not use profiling/performance in the beginning, premature optimization is the root of all evil 97% of times
# Design codes, validate once it works fine, then do optimizing. Act as a scientist by collecting data

########################################################################################
# system.time() - used to get the time in second took for execution
########################################################################################
f <- function() {for(i in 1:100){
    print("pradeep")
}
}
system.time(f())
# Produces User time, system time and elapsed time
# User Time: Time taken by the CPU to run the code, time charged to CPU
# Elapsed Time: Time taken by the wall clock of yours :), Time that you experiance
# Usually user time and elapsed time is almost equal. At times they might differ
# ET > UT = When doenloading any data from web, here n/w dependency is higher
# ET < UT = when multi core is used for executing the program, R doesnt uses, however few R packages are optimized to use multi-core
# As a lead, identify the problem first and part where the bottle necks are and then use it
# At times when you cant find where the bottle nect is happening, we can make use of R- Profiling


################################################################################################
# R-Profiling - Rprof() - Do not use RProfile() and system.time() together - you will feel worst
################################################################################################

# Keeps function call stack and time taken by ech function
# if function takes less than 0.02 sec Rprofile() is not usefull
# Use Rprofile where CPU takes long time atlease in few sec
Rprof()
head(data1)
model1 <- lm(Ozone~Solar.R+Wind+Temp+Month+Day,data = data1)
Rprof(NULL) # produce o/p in Rprof.out file in the working directory

setwd("D:/Courses/Coursera/R")
model1 <- lm(Ozone~Solar.R+Wind+Temp+Month+Day,data = data1)
summaryRprof()

# There are 2 methods for normalizing the data
# by.total = Divide the time spend in each function by total run time
# by.self = Does the same, but first subtracts out the time spent in the functions above the in the call stack
# by.self is the most useful one in increaing the performance of the code
# sample.interval = user time in system.time function
# sampling.time = elapsed time in system.time function


# Quiz Week-4

# Qustion-1 :These are just pseudo random numbers, create a vector of length 5
set.seed(1)
rpois(5, 2)

# Question-2: rnorm() - standard normal random variables
rnorm(5)

# Question-3: used for reproducebility and also produce randome variable with in specific boudaries
set.seed(1)

# Question-4: Evaluate the inverse inverse cumilative distribution for a poison distribution
# q - is used for inverse cumulative distribution
# p - is used for cumulative distribution


#Question-5
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x,y)

