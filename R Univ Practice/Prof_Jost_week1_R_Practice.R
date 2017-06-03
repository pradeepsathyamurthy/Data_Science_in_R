# R Learning from week-5 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24, 2017
# Topics Discussed: R-Help, c, mode, length, class, typeof, is/as operators, rep

# Topic-1
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


