####################################################################
# Week-3
# Regular Expression
####################################################################
data.rest <- read.csv("Restaurants.csv",header = TRUE)
names(data.rest)
# Lower casing the column names
tolower(names(data.rest)) # This will lower case the column names

# Filing the column names with split
splitnames <- strsplit(names(data.rest),"\\.")
splitnames[[6]] # this method will split the column name with mentioned spl character
splitnames[[6]][1]
# automating with functions
firstelement <- function(x){x[1]}
sapply(splitnames,firstelement)

# Substituting with sub() function
review <- data.frame(id=1,solution_id=2,reviewer_id=3,start=4,stop=5,time_left=6,accept=7)
names(review)
sub("_","",names(review)) # This will substitute with only the first occurence
testName <- "this_is_a_test"
gsub("_","",testName)

# Finding values - grep() and grepl()
data_sample <- "This is prady and he is prady"
close(data_sample)
print(data_sample)
grep("prady",data_sample) # will list the indexes at which word prady has occured in 
table(grepl("prady",data_sample)) # this will tell the number of times of occurence
grep("prady",data_sample,value = TRUE) # display the values where word prady has occured
lenght(grep("prady",data_sample))

# Useful string functions
library(stringr)
require(stringr)
nchar("Pradeep Sathyamurthy") # displays the number of charcter in a sring
substr("Pradeep Sathyamurthy",1,7) # slice a particular string
paste("Pradeep","Sathyamurthy") # used to concatenate strings
paste0("Pradeep","Sathyamurthy") # Used to concatenate strings without space
str_trim("Pradeep    ") # used to trim the extra space, like rstrip in R

# Important notes about text in datasets - that is how to maintain column names in dataset
# 1. Have all columns lower case when possible
# 2. Have the columns name decriptive
# 3. Have no duplication in column name
# 4. Do not have underscore or white spaces or any special characters in column names
# 5. Variables with character value should usually be made into the factor variable names and descriptive

###############################################################################################################
# Regular Expression - This is a combination of Literals and Metacharacters - used along with grep() or grepl()
# Part-1
###############################################################################################################

# to find the line starting with a particular pattern
?grep # Normally returns the whole line where the match is found
grep("^i think","I think i am pradeep and i think i am so fortunate to get some great friends in life", ignore.case = TRUE)

# to find the lines ending with a particular pattern
grep("morning$","Hi Good morning")

# to display a particular pattern
grep("[pP][rR][aA][dD][yY]", "hi prady how are you PradY")

# Character classes with []
grep("^[Ii] am","i am pradeep",value=TRUE)

# simplifying the range of characters - orders doesnt matter - finds number with some char associated
grep("^[0-9][a-zA-Z]","5th is the highest rating in CRR") # note that order doesnt matter

# to display matching characters NOT in the indicated class
grep("[^?.]$","we all will survive anyways!")

###########################################################################
# Regular Expression - This is a combination of Literals and Metacharacters
# Part-2
###########################################################################
    
grep("9.1","hi my height is 9_1, he he i am just joking") # . used to match any character with that pattern

grep("flood|fire","I escaped from flood in chennai") # | used to match a line with one or the other, any number of character can be involved

grep("^[Gg]ood|[Bb]ad","Good boy") # used to match the pattern

grep("^([Gg]ood|[Bb]ad)","Good boy") # see what does this do

grep("[Gg]eorge( [Ww]\.)? [Bb]ush","I know who is George W Bush, he was the american president") # Throwing error, find why

grep(".*","any one wanna chat? (24,m,german)") # used to indicate the repitition, i dont know what it does

grep("[Bb]ush( +[^]+ +){1,5} debate","") # this will print all line that has word Bush followed by max 5 char and then debate

###########################################################################
# Dates - Working with dates
# 
###########################################################################

d1 <- date()
d1
class(d1) # This is a character class

d2 <- Sys.Date()
d2
class(d2) # This is a date class, defaul date format is 'YYYY-MM-DD' that is '2016-12-24'

# Date formatting
# %a = abbrevated weekday
# %b = abbrevated month
# %d = date as number(0-31)
# %m = month as number (00-12)
# %y = 2 digit year
# %A = Un-abbrevated weekday
# %B = Un-abbrevated month
# #Y = 4 digit year
format(d2,"%a %b %d")

# creating dates
x=c("1jan2016","2jan2016","31mar2016","30jul2016")
z=as.Date(x,"%d%b%y") # remember the date format in R is always 'YYYY-MM-DD' that is '2016-12-24'
z[1]-z[2]
as.numeric(z[1]-z[2])

# converting to julian
weekdays(d2)
months(d2)
julian(d2) # this is the number of days from the origin date being 1970-01-01

# lubridate
install.packages("lubridate")
require(lubridate)
ymd(20140501)
mdy("08/04/1978")
dmy("03-04-2013")

# Dealing with time
ymd_hms("2011-08-03 10:50:03")
ymd_hms("2011-08-03 10:50:03",tz="GMT")
?Sys.timezone
Sys.timezone(location = TRUE)

# Some function have diffrent syntax
x = dmy(c("1jan2013","2jan2014","31mar2013","30jul2014"))
wday(x[1])
wday(x[1],label = TRUE) # this is the right systax that does the needed job



