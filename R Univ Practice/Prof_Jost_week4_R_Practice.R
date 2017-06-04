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
