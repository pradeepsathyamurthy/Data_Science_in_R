############################################
############################################
# Practice of R Week-1                     #
############################################
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

