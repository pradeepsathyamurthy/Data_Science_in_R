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


