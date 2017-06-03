# R Learning from week-5 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24, 2017
# Topics Discussed: R-Help, c, mode, length, class, typeof, is/as operators, rep/seq, ^ and %%, 
# speacial values (NA NaN Inf NULL), cat/print, matrix, attributes, dim/dimnames, list/$, scan, 
# File read: read.table, read.csv, read.fwf, source

# Topic-1
# R is case sensitive
# R Help command
help(data.frame) # Used to find help on any R objects
?data.frame # anaother way to access help in R

# Setting working directory
setwd('D:/Courses/Coursera/Data_Science_in_R/R Univ Practice')
getwd()

# Quiting R Program
quit()

# Topic-2
# Every thing in R is an object, however we cannot say R is a object oriented language
# there are 4 major mode of datatypes
# character, numeric, logical and complex number
# there is nothing like string in R it is just characters

# Atomic elements do not exist in isolation. They are the components of vectors. A scalar element is actually a vector of length 1. 
# A vector consists an arbitrary number of atomic elements, all of the same mode. 
# Use the c function to combine atomic elements or vectors into a vector. The assignment operator = assigns the vector determined by the expression on the right hand side to the variable x on the left hand side. Some examples:
values = c(33, 5, 429, 37)
animals = c("dog", "cat", "mouse")
flags = c(TRUE, FALSE, TRUE, TRUE, FALSE)

# <- is the assignment operator in R and it is an interactive programming like Python. Hit the variable to know its values
values <- c(33, 5, 429, 37)

# Here is a list of the atomic modes, from most restrictive to least restrictive: 
# logical numeric complex character 
# R allows to create a vector of different modes, but on execution it will convert them into a one single mode based on least restrictive specified above
values1 <- c(T, 34, "dog") # <- R will change everthing in to char as CHAR is the least restrictive data type

# mode function used to determine the type of a vector
# class function is also used for the same
# length is used to find the length of a vector
# is operator is used to check if the mode of a vector, gives T/F value
mode(values)
class(values1)
typeof(flags)
length(values)
is.numeric(values)
is.atomic(animals)
# atomic elements are those which cannot be decomposed into further smaller elements
is.atomic(flags)
is.atomic(values)
# use as function to convert the mode of a vector
# as.character as.complex as.logical as.numeric
as.character(1)
as.numeric("2")
as.logical("T")
as.complex(43)

# repetation and sequences
r = rep(45, 5) # <- repeats 45 almost 5 times
q = seq(from=3, to=5.5, by=0.5)
p = seq(from=900, to=600, by=-100)

# m:n creates a sequence from m to n, inclusive. in R index starts with 1 unlike Python which is 0
s = 1:6
r = 9:6

# An operator precedence table of R operators, some important unused opearator are discussed below, look for table for anymore
2^3 # <- Exponentiation
4%%3 # <- Mod operator, returns reminder
3%/%2 # <- integer division, you will not get a floating value, value is always discreate
4/3 # <- Division, provides floating or continuous value

# Speacial values in R, all these are case sensitive
NA # <- Not applicable, stands for missing values
Inf # <- Infinity, for values which are outof range for e.g. 2^10000
NaN # <- Not a Number, result of an arithmetic operation that is undefined for e.g 0/0 Inf/Inf Inf*0 Inf - Inf
NULL # <- null object. Returned by expressions and functions whose return value is undefined

# Printing the R objects
# Entering an expression in a script file will not automatically display the value of the expression. 
# Use the print function to display the value. For example print(mean(x))
# An alternative to print is the cat command. 
# Using print includes the vector index at the beginning of each output line and quote marks for character data. 
# Using cat suppresses vector indices and quote marks for character data. 
# Also, new line characters (\n) must be explicitly included with cat
cat('Matrix M\n\n',m) # Cat wil concatenate and print i.e. categorise between Text to be printed and R objects
print('Matrix M\n\n',m) # Print would just print what is giben inside the quotes, prints only the first argument
mean(x)
print(mean(x))
print("The mean of the vector x is ", mean(x))
cat("The mean of the vector x is ", mean(x), ".\n")

# Matrices 
# A matrix is a two-dimensional array of atomic elements
# An n * m matrix is a matrix with n rows and m columns
# Use the matrix command to format a vector into rows and columns, take care there is a right element count in vector to forma matrix of defines size
v = c(4, 2, 5, 9, 4, 7, -1, 6, 0, 3, 2, 7)
m = matrix(v, 3, 4, byrow=TRUE) # <- Vector is converted to becomes a two dimentional object in R now
# + - Matrix Addition * - Scalar Multiplication %*% - Matrix Multiplication t - Transpose diag(nrow=n) - Identity solve - Inverse
# Matrix Example 
# Read data from a file into a matrix.
setwd('C:/datasets')
M <- matrix(scan('matrix.txt'), 20, 20, byrow=T)
print(M)
setwd('D:/Courses/Coursera/Data_Science_in_R/R Univ Practice')
# An array is an extension of the matrix data struction to possibly more than two dimensions
# Read data from a file into a 3x3x3 array.
setwd('C:/datasets')
cat('Array A\n\n')
A <- array(scan('array.txt'), c(3, 3, 3))
print(A)
setwd('D:/Courses/Coursera/Data_Science_in_R/R Univ Practice')

# Subsetting Vector and matrix
# [] is the subset/slicing operator
# 1. Subsetting with +ve indices
a = c("apple", "orange", "pear", "grape")
u = c(1, 4)
a[u]
a[c(1,4)]
# 2. use a vector of negative indices, values in these -ve indeces are omitted by the subset operator
v=c(-2,-3)
a[v]
# 3. use vector of boolean value
w=c(T,F,F,T)
a[w]
# The subset operator for a matrix takes two inputs
m <- matrix(1:50,10,5,byrow = T)
m[5:10, -4] # <- Rows 5 through 10 are selected and column 4 is omitted from the matrix m
# If a slice of width 1 is selected from a matrix, a vector will be produced, as in this example
m[,3] # <- subsetting column in a matrix object
m[3,] # <- subsetting row in a matrix object
m[,3, drop=F] # <- To preserve the matrix structure of this slice, include the drop=F argument

# Attributes - These are properties associated with an object
M <- matrix(c(4.5, 2.9, 0.7, 4.0), 2, 2, byrow=T)
cat('Matrix M:\n')
print(M)
cat('Attributes of M:\n')
print(attributes(M))
# Now create a matrix with dimnames attributes.
A <- matrix(c(34, 8, -2, 21), 2, 2, byrow=T,dimnames=list(c('r1', 'r2'), c('c1', 'c2')))
print(A)
print(attributes(A))
# See what these matrices look like if you consider them to be vectors.
print(as.vector(M))
print(as.vector(A))
# M and A are not vectors because of their extra attributes.
print(is.vector(M))
print(is.vector(A))
# We can change M and A into vectors by throwing away their attributes.
dim(M) <- NULL
dim(A) <- NULL
dimnames(A) <- NULL
cat('Are M and A vectors?\n')
cat(is.vector(M), '  ', is.vector(A), '\n')
cat('Matrix M:\n')
print(M)
cat('Matrix A:\n')
print(A)

# List
# list is a R data structure with a named component associated with it
scores <- list(name=c("Jason","Ginger","Mary"),midterm=c(89, 93, 90))
is.atomic(scores) # <- list is not atomic, means it can be further decomposed
class(scores) # list is a speacial class object in R that deals with data structure
# subsetting list - $
scores$name #<- use $ with attribute name to subset that particular vector from list

# Dataframe - alternative to list which looks like a conventional dataset
scores1 <- data.frame(name=c("Jason","Ginger","Mary"),midterm=c(89, 93, 90))
is.atomic(scores1) # this is again not atomic in nature
class(scores1) # # data.frame is a speacial class object in R that deals with data structure

# File input
# Scan funtion is used to read the data from user as part of keyborad input or through input files
# Enter a blank line to terminate input from keyboard
x = scan() # <- this will read data and create a vector object
setwd('C:/datasets')
y <- scan('matrix.txt')
print(y)
# To load data from a file in table format, use the read.table function. 
# The current working directory contains the file scores.txt with these contents
scores2 = read.table("scores.txt", header=TRUE) # make sure the data file has end of line in the final line
scores2$name
# 1. Space Delimited
kids1 <- read.table('kids1.txt', header=T)
# 2. Comma Delimited
kids2 <- read.csv('kids2.txt', header=T, sep=',')
# 3. Fixed Width Fields
kids3 <- read.fwf('kids3.txt', widths=c(10,1,2), header=F, col.names=c('name', 'gender', 'age'))
source("Prof_Jost_week2_R_Practice.r") # <- these are use to inherit any methods from other files 
setwd('D:/Courses/Coursera/Data_Science_in_R/R Univ Practice')

# Redirecting the output to disk or secondary storage
# it is like a spool command in SQL
sink("output_sample.txt") # <- need to mention the file name when we need to start writing the output
print(x)
mean(x)
cat('Mean of vector x is:::', mean(x),'/n')
sink() # <- stops the sink initiated and start to return o/p to RAM

