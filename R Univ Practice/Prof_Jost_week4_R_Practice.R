# R Learning from week-8 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24, 2017
# Topics Discussed: R S3 Objects

# Classes and Methods
# We know in R everything is seens as a object
# A class is a definition of an object
# for e.g. Car is an object, it can be defined as a m/c with 
# 4 wheels, stearing, seats and engine which can drive us
# Similarly a class in R is a definition to some object 
# A class contriants attributes and methods 
# Attributes define how a object looks like colour of a car
# Methods defines how a object behave/function like cruize mode driving
# Function in S3 class can be generic or custom
# Generic function are used to determine the class of its argument and select appropriate methods to actionize
# A generic function is a function with a collection of methods
# Some examples of generic function are: summary(), print(), plot(), etc., 
# For example lets say there is a print() function which normally carry only one argument
# However with S3 class we can create a spl method, after that when print carries more than 1 argument
# R will look for class which corresponds to it and find the exact method which carry more than 1 argument in print and execute
data.toothgrowth <- ToothGrowth # <- This is a data frame object
summary(data.toothgrowth) # <- this a generic function that call method summary.data.frame() used to summarize the content of dataset column wise
fit <- lm(len ~ supp + dose, data = data.toothgrowth) # <- this is again a generic class
class(fit) # navigated by generic function
summary(fit) # navigated by generic function
summary.lm(fit) # navigated by generic function

# S3 and S4 classes
# S3 is a old style class, it is quick, dirty and informal
# s4 is a new style class, rigorous and formal
# Most of the R objects are built in S3. However, objects constructed nowadays are in S4 class type
# S3 class approach is simple to implement
# Just add class name to an object, no formal requirements, just expect object to have right information

# S3 Class construction
# As a practice we will create a S3 class called infant
# This object will have growth details from birth to 36 months
# object will contain: 1. ID Number, 2. Gender, 3. dataframe of age, height and weight
# Step-1: Set class attribute of the object using class()
# Step-2: set methods by writing function with name 'generic.class'
#           generic => generic function name, class => class for the method
# Usage ============>>>>>>>>>>>>>>>>>>
# class(x) Get or set the class attributes of x
# unclass(x) Remove class attributes of x
# methods(generic.function) All available S3 methods for a generic function
# methods(class="class") Get all S3 methods for a particular class
# is(object) Return object's class and all super-classes
# is(object, class2) Tests if object is from class2
# str(object) Display the internal structure of an object

# Prof. Jost examples
# 1. Creating/instantiating a S3 Class object
k1 <- list(name="Alice", gender="F", age=11)
class(k1) = "Kid"
# Print the kids object created
print(k1)

# Constructor to create a S3 class object
kid <- function(theName, theGender, theAge) {
    theObject <- list(name=theName, gender=theGender, age=theAge)
    class(theObject) = "Kid"
    return(theObject)
}

# Creating kids object using constructor and printing with generic function
k2 <- kid("Mark","M",12)
print(k2)

# Visible and Invisible methods
# we build our custom methods above the generic methos which is available from R
# all print methods available in R can be seen through 
methods(print)
# there are visible and non-visible methods, those with * are identified as non visible methods
# if a method is visible via methods(), its source code can be viewed by typing its name in R
print.data.frame # <- this is a visible methods, its source is displayed
print.zoo # print.zoo* is a non-visible, that is its source code cannot be viewed
getAnywhere(print.zoo) # <- however even a invisible methods can be viewded through a function called getAnywhere()

# Defining custom methods, it is going to be a custom print method
print.Kid <- function(theObject) {
    cat(theObject$name, theObject$gender, theObject$age, "\n")
}
# using the custom print method
print(k1) # Generic method/Generic Function
print.Kid(k1) # Custom method/Custom Function

# Defining a method whose generic class do not exist
haveBirthday(k1)
# lets define it using the usemethod
haveBirthday <- function(theObject) {
    UseMethod("haveBirthday", theObject)
}
# Now define our custom function derived from a custom function
haveBirthday.Kid <- function(theObject) {
    theObject$age <- theObject$age + 1
    return(theObject)
}
# Testing the newly created custom function
haveBirthday(k1)
haveBirthday(k2)
# For S3 classes, whenever a new method is defined, 
# it is customary to define a default version of that method in case the method is called on the wrong type of object. For example
haveBirthday.default <- function(theObject) {
    warning("Default haveBirthday method ", 
            "called with unrecognized object")
    return(theObject)
}
# Finally, we define accessor methods (getters) that return the values of the individual components name, gender, and age
getName <- function(theObject) {
    UseMethod("getName", theObject)
}
getName(k1) # <- THis will return a error at this point as no applicable methods for getName is applied
# defining methods in getName
getName.Kid <- function(theObject) {
    return(theObject$name)
} 
getName(k1) # <- THis will not return the name
getAge <- function(theObject) {
    UseMethod("getAge", theObject)
}
getAge.Kid <- function(theObject) {
    return(theAge$name)
} 
# This how the ansestor method works, I mean this how we define a getter method in R


################################################################################################################################
# Some more examples from book 
# S3 class construction and usage
################################################################################################################################

# Instantiating a S3 class object
infant <- function(ID, sex, age, ht, wt){
    out <- list(ID=ID,sex=sex,data=data.frame(Age=age,HT.cm=ht,ET.kg=wt))
    class(out) <- "infant"
    invisible(out)
}
# Instantiating method for infant class
print.infant <- function(object){
    cat("ID =", object$ID, "\nSex =", object$sex, "\n")
    print(object$data)
}
# Infant "data"
age = c(0, 3, 6, 12, 18, 24, 30, 36)
male.wt = c( 3.53, 6.39, 8.16, 10.46, 11.80, 12.74, 13.56, 14.33)
female.wt = c( 3.40, 5.86, 7.45, 9.67, 11.09, 12.13, 13.04, 13.87)
male.ht = c(49.99, 62.08, 67.86, 76.11, 82.41, 87.66, 92.13, 95.45)
female.ht = c(49.29, 60.46, 66.12, 74.40, 80.80, 86.20, 91.13, 94.43)
# Calling infant objects
x <- infant(1, "male", age, male.ht, male.wt)
y <- infant(2, "female", age, female.ht, female.wt)
class(x); class(y)
# Print infant objects
x; y
# Possible to create invalid objects with S3 classes
z <- infant(3, "male", c("0 mon", "3 mon"), c(49.99,62.08), c(3.53,6.39))
