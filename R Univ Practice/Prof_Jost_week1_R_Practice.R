# R Learning from week-5 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24,2017
# Topics Discussed: R-Help, c, mode, length, class, typeof, is/as operators, rep/seq, ^ and %%, 
# speacial values (NA NaN Inf NULL), cat/print, matrix, attributes, dim/dimnames, list/$, scan, 
# File read: read.table, read.csv, read.fwf, source, sink
# Functions: function(){}, 'funct1<-'=function(){}, '%.%' <- function(u, v){}, R-built in functions
# Factors: factor(vector1)

# Topic-1
# R is case sensitive
# R Help command
help(data.frame) # Used to find help on any R objects
?data.frame # anaother way to access help in R

# Setting working directory
setwd('D:/Courses/Coursera/Data_Science_in_R/R Univ Practice')
getwd()

# Quiting R Program
q()
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
mode(values) # u can change the mode of a object like this as well mode(v) <- "character"
class(values1)
typeof(flags)
length(values) # u can change the length of a object like this as well length(v) <- 10
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
# In simple terms:
# print can only print a single object and it knows how to format the object. 
# cat can print multiple objects, but does not know about formatting.
# Most nonatomic objects, for example lists and data frames, cannot be printed with cat. 
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
# R is written from fortan which is a column major, unlike c, c++, java which are row major
# thus by default byrow=FALSE
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

# R in-built function
# 1. Help Function and Operator
?cat
help("cat")
?'%%' # <- For help with symbols, place them in backquotes

#2. Vector Construction
x <- c(1,2,3,4,5,6,7,8,9,10,1,1,2,4,4,4,4,4) # <- c can be called as a construct function
y <- c(1:18)
z <- seq(-10,10,0.234)
length(x) # Used to find the vector length 

#3. Stat Functions
mean(x) # <- mean of a vector object
sd(x) # <- standard deviation of a vector object
quantile(x) # <- find the generic quantile of vector object, default probablity seq increment is 0.25
quantile(x,probs = seq(0,1,0.05)) # <- prob seq range from 0 to 1 and increment is set to 0.05 here
median(x) # <- find the median of a vector object x
IQR(x) # <- find the inter quantile range
var(x) # <- find the variance of a vector object
cor(x,y) # <- find the correlation between two vector object

#4. Math Utility Functions
sum(x) # <- give the sum of vector object x
sqrt(x) # <- give the square root for individual element in vector object x
square(x) # <- give the square for individual element in vector object x
sum(square(sqrt(x))) # <- cascade function that can be bilt in R
prod(x) # <- give the product of vector object x
log(x) # <- give the natural log for individual element in vector object x
abs(z) # <- give the absolute value (without sign) for individual element in vector object x
ceiling(z) # in case of negative ceil done based on highest value of -ve(-9.8=-9), and for +ve higher value of +ve (9.8=10)
floor(z) # opp to ceiling, wrap to lowest value of -ve and +ve numbers
round(z) # anyting more than 0.5 is taken to next highest value for +ve and next lowest for -ve values
sign(z) # <- indicate weather a number is +ve or -ve, indicated as +1 or -1 for the same

#5. Trig Functions
sin(x)
cos(x)
tan(x)
asin(x) # <- used to compute arc-sin
acos(x)
atan(x)
atan(x)
pi # returns a pi value of 3.14
sin(pi)

#6. Exponential and Logarithms
log(x) # <- Natrual log
log10(x) # <- log to the base of 10
log2(x) # <- log to the base of 2
log1p(x) # <- log to the base of |x+1|
exp(x) # <- exponential of x for the power of e^x, where value of e is 2.718282

#7. Character or important string functions
str1 <- 'My Name is Pradeep Sathyamurthy'
str2 <- 'I am doing my masters in DePaul'
str3 <- c('Specialization in Data Science', 'Skilled in Python, SAS, R, Big Data')
# Unlike Python, R characters/strings are also mutable like any other data types
str3[2] <- 'Skilled in Python, SAS, R, Big Data, Tableau'
nchar(str1) # <- length() to vector is nchar() to string, give the length of the string
paste(str1,str2,str3) # <- concatenate char R-objects & Vectors
substr(str1,1,18) # <- used to subset a string based on a start and stop value, remember R index starts with 1 and not 0
toupper(str3) # <- Converts a string or character vector to upper case
tolower(str2) # <- Converts a string or character vector to lower case
chartr('i','I',str3) # <- Replace old char with new, here 'i' is replaced with I
strtrim(str3,5) # <- Used to trim the character object
strsplit(str3,split=',') # <- used to split the string based on a spilt char mentioned, it can be a space or any symbol like , or |

#8. Matrix Operations
A <- matrix(1:9,3,3,byrow = T)
B <- matrix(10:18,3,3,byrow = T)
b <- c(1:3)
A+B # <- Matrix Addition
A-B # <- Matrix Subtraction
A%*%B # <- Dot Product
A*B # <- Scalar Product
t(A) # <- Transpose a matrix, row to col 
diag(A) # <- extract the diagonal of a matrix
solve(A,b) # <- solve the equation A*x=b
det(A) # <- findt the determinant of a Matrix
?solve

#9. Apply a Function to margins of Matrix, Array, or to List Elements
cube1 <- function(x){
    x^3
}
A <- matrix(1:9,3,3,byrow = T)
apply(A,1,cube1)  # apply is used on a matrix object only, second argument defines how a funct needs to be applied by rows or by columns, 3rd argument is the function that nees to be applied
apply(A,2,cube1) # computes cube based on column elements
b <- c(1,2,3)
lapply(b,cube1)  # lapply is used for list/array objects and returns list object
sapply(b,cube1) # it is a wrapper of lapply which returns vector, make easy to use

#10. Bind Together Matrices
# bind functions are mainly used on a matrix object which is more than 1 dimentional 
# by default byrow is always FALSE
A <- matrix(1:9,3,3,byrow = T)
B <- matrix(10:18,3,3,byrow = T)
rbind(A,B) # Merge/Bind by rows
cbind(A,B) # Merge/Bind by Columns

#11. R Utility Functions
ls()
rm()
setwd()
getwd()

#12. Execution Time of Function
system.time(rnorm(10000000)) # <- computes the execution time of an R function call
# give user, system and elapsed time
rnorm(10) # <-generates a vector of n independent standard normal random variables. Standard normal means mean=0 and standard deviation=1

#13. Distributions and Densities 
pnorm(10)
dnorm(10)
rnorm(10)

# R User defined function
# x = parameters and y = return value
square <- function(x) {
    y <- x^2
    return(y) # <- R returns the value of the last statement executed in a function and so we can remove this y if needed
}
# Calling a function that was built
square(4)

# User defined replacement function
# A replacement function looks as if it modifies the argument of a function
v <- 1:4
'second<-' <- function(v,value){
    v[2]=value
    return(v)
}
second(v) <- 5
print(v)
# Note that back quotes are needed to define the second<- function.
# it means directly substitue 5 in second index, it can be simply done as v[2]<- 5

# user defined operator
# A user defined operator is delimited with % symbols
# Here is the definition of the vector dot product
'%.%' <- function(u, v) {
    return(sum(u * v))
}
# Again, note that double quotes are needed to define %.%
# The dot product operator can be tested like this
a <- 1:4
b <- 1:4
a %.% b

# Factors
# A factor is the R represention for categorical data
days <- factor(c('Wed', 'Thu', 'Sat', 'Mon'))
# To record all possible levels of the factor, not just the ones that happen to be in days, use the levels parameter
days.of.week <- c('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')
days <- factor(c('Wed', 'Thu', 'Sat', 'Mon'), levels=days.of.week)
# Factors are actually represented internally by numbers
as.numeric(days)
# A factor can be used in R statistical analysis functions or plotted like this
time <- c(65, 68, 66, 31)
plot(days, time)



