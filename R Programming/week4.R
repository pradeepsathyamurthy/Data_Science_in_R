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