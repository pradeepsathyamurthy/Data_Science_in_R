####################################################################
# Author: Pradeep Sathyamurthy
# Course: Data Science-2 Getting and Cleaning Data
# Date: 1 Dec 2016
####################################################################


####################################################################
# Week-1
####################################################################

setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data")
list.files(getwd())

# Creting a new directory
if(!file.exists("trail")){
    dir.create("trail")
}
setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data/trail")


# downloading data from web
url <- "some URL link"
download.file(url, destfile ="file name with extention", method = "curl")
data_downloaded <- date()
print(data_downloaded)

# Reading local text file - this is comparitively slow for big data set
read.table("file name", header = TRUE, sep = ";")
# Some importatn parameters are quote, na.string, nrows and skip
require(xlsx)
read.xlsx("file name",sheetindex=1,header=TRUE,sep=";")
colindex <- 3:2
rowindex <- 1:2
read.xlsx("file name",sheetindex=1,header=TRUE,colIndex=colindex, rowIndex=rowindex,sep=";")

# Extracting a XML data
install.packages("XML")
require(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL,useInternalNodes = TRUE) # thre is also html treeparse
rootnode <- xmlRoot(doc)
xmlName(rootnode)
names(rootnode)
rootnode[[1]]
rootnode[[1]][[1]]
xmlSApply(rootnode,xmlValue)

# Extracting the JSON object
install.packages("jsonlite")
install.packages("curl")
require(jsonlite)
require(curl)
jsondata <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsondata)

myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

# data.table package - will be covered as part of week-3

####################################################################
# Week-2
# Some important URL's
# for public mySQL - http://genome.ucsc.edu/goldenpath/help/mysql.html
# instruction to install R Package - http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL
# cran documentation: https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
# Some my SQL command: http://www.pantz.org/software/mysql/mysqlcommands.html
# mysql and R: https://www.r-bloggers.com/mysql-and-r/
####################################################################

# Reading data from my SQL
install.packages("RMySQL")
require(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); result
dbDisconnect(ucscDb);

hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
alltTables <- dbListTables(hg19)
length(alltTables)
alltTables[1:5]
dbListFields(hg19,"HInv")
dbGetQuery(hg19, "select count(*) from HInv")
affyData <- dbReadTable(hg19,"HInv")
head(affyData)
query <- dbSendQuery(hg19,"select * from HInv where mrnaAcc")
affyMis <- fetch(query)
affyMisSmall <- fetch(query,n=10)
dbClearResult(query)
dim(affyMisSmall)
dbDisconnect(hg19)

# Reading the data from HDF5
# This is a High Dimentional Format data which store large dataset of information with dataset and its metadata
# Mostly used in Biostats field, we will not concentrate this for now

# Reading the data from webpages
con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlcode <- readLines(con)
close(con)
require(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- xmlTreeParse(htmlcode)
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@id='col-citedby']",xmlValue)

# httr package - this is a little easy packag to use - try to use this
install.packages("httr")
require(httr)
html2 <- GET(url)
content2 <- content(html2,as="text")
parsedHTML <- htmlParse(content2,asText = TRUE)
xpathSApply(parsedHTML,"//title",xmlValue)

pg1 <- GET("https://accounts.google.com/ServiceLogin?sacu=1#password")
pg1
pg2 <- GET("https://accounts.google.com/ServiceLogin?sacu=1#password",authenticate("pradeepindepaul","Infy@123"))
pg2
names(pg2)
google=handle("htttp://google.com")
pg1 = GET(handle=google,path="search")

# Getting data from API
myapp <- oauth_app("twitter",key="consumerkeyhere",secret="consumersecrethere")
sig <- sign_oauth1.0(myapp,token="tokenhere",token_secret = "tokensecrethere")
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)
# Converting the JSON object
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

####################################################################
# Week-3
# data.table
# data.table is discussed with main concentration on dplyr package
# Latest sourse code of data table: http://r-forge.r-project.org/scm/viewvc.php/pkg/NEWS?view=markup&root=datatable
# Things that can be done in df which cannot be done by dt: http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table
# For notes: https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rmd
# For complete Biostatistics notes: https://github.com/raphg/Biostat-578
####################################################################

# Need of data.table when we already have data.frame is to increase the efficiency in data processing
# data.table is much faster in subsetting, grouping and updating

# Creation of data.table
# This is same like creating the data.frame
require(data.table)
# Data frame creation
sample_df <- data.frame(x=rnorm(9),y=rep(c('a','b','c'),each=3),z=rnorm(9))
print(sample_df)
# Data table creation
sample_dt <- data.table(x=rnorm(9),y=rep(c('a','b','c'),each=3),z=rnorm(9))
print(sample_dt)
head(sample_dt,3)
tables() # this will list all the data tables stored in RAM, this will not list any data frames

# Subsetting the rows - This is a process of selecting only a very specific values from tables
sample_dt[2,] # returns all the collunm of the second row
sample_dt[sample_dt$y=='a'] # to filter based on a particulat collumn
sample_dt[c(3,2)] # selecting only specific rows, subsetting rows (one index - subsetting is based on rows)
sample_dt[,c(3,2)] # slecting only specific collumn, subseeting collumns

# Collumn subsetting in data.table
k={print(10);5}
print(k)
sample_dt[,list(mean(x),sum(z))]
sample_dt[,table(y)]

# Adding new collumns
sample_dt[,w:=z^2] # this is the main diff between dataframe and datatable. 
# datatable will not create multiple copies in RAM as dataframe does
sample_dt2 <- sample_dt
sample_dt[,y:=2] 
head(sample_dt,3)
head(sample_dt2,3)
# Thus, if you need to retain the old data table, we need to explicitly take the copies of them 
# using the copy function
copied_dt <- copy(sample_dt)
sample_dt[,c:=x^2]
print(sample_dt)
print(copied_dt)

# Multiple operation
sample_dt[,m:={temp<-(x+z);log2(temp+5)}]
sample_dt3 <- sample_dt

# plyr like operation
sample_dt[,a:=x>0]
sample_dt4 <- sample_dt

# takes mean of x+w where a = true and place it in collun 'a' where true
# then takes mean of x+w where a = false and place it in collumn 'a' where false
# this is an aggregated and a grouped mean applied to a collumn
sample_dt[,b:=mean(x+w),by=a] 
sample_dt5 <- sample_dt

# Special Variables .N
# .N is an integer of length 1 and containg the number r
# .N is used to count the number of times a word is occured in a large table
set.seed(123)
sample_dt6 <- data.table(x=sample(letters[1:3],1E5,TRUE)) # this is just a sample data generation
# This is we ask to consider whole table and apply the count function grouped by variable 'x'
# this will count number of times each letter has been occured in x
sample_dt6[,.N,by=x]

# keys
# setting key will make the job of subsetting and grouping a data table more easily 
sample_dt7 <- data.table(x=rep(c('a','b','c'),each=100),y=rnorm(300))
setkey(sample_dt7,x) # setting the key on variable x
sample_dt7['a'] # now directly use the key for subsetting and joins

# joins
sample_dt8 <- data.table(x=c('a','a','b','dt1'),y=1:4)
sample_dt9 <- data.table(x=c('a','b','dt2'),y=5:7)
setkey(sample_dt8,x); setkey(sample_dt9,x)
merge(sample_dt8,sample_dt9)

# Fast reading, reading data from data.table is more fater than reading from data.frame
read.table(file_name,header = TRUE,sep="\t")

####################################################################
# Subsetting the data
# This is a revision to see how to subset a dataset in R
####################################################################

# Before we practice subsetting we will create a dataset with which we will play some
# We will practice this based on data in data frame as well as data table

# Data frame creation
df_sample <- data.frame(var1=sample(1:5),var2=sample(6:10),var3=sample(11:15))
# let us purposefully inject some NA character in the above generated dataframe
df_sample <- df_sample[sample(1:5),]
df_sample$var2[c(1,3)]=NA
print(df_sample)

# Data table creation, creating data set as above
dt_sample <- data.table(var1=sample(1:5),var2=sample(6:10),var3=sample(11:15))
tables() # Checking the existance of data.table in RAM
dt_sample$var2[c(1,3)] = NA
print(dt_sample)

# subsetting commands
# selecting a collumn with name var1 alone
set.seed(1000)
df_sample$var1
df_sample[,1]
df_sample[,"var1"]
# selecting only a particular value from a dataframe
df_sample[1:2,"var2"] #trying to select only the first and second valuein collumn var2
df_sample[c(3,5),"var2"] #selcting random values in a particular collumn

# trying the same with data.table
set.seed(1000)
dt_sample[,var1]
# selecting only a particular value from a data.table
dt_sample[1:2,var2]
dt_sample[c(3,5),var2] #selecting random values in a particular collumn

# Logical ands and ors
df_sample[(df_sample$var1 <= 3 & df_sample$var3 > 11),] # Selecting based on two or more collumn
df_sample[(df_sample$var1 <=2 | df_sample$var3 >15),] # using the or logic 
# Using the same with data.tables
dt_sample[var1 <=3 & var3 >11]
dt_sample[var1 <=2 | var3 >15]

# Dealing with missing values
# to remove all the missing values in a dataset we can use completecase function, but this is hardly used
# below are few methods to deal with missing values
is.na(df_sample$var2)
is.na(dt_sample$var2)

# Sorting the data
sort(df_sample$var1)
sort(df_sample$var1, decreasing = TRUE)
sort(df_sample$var2, na.last = TRUE) # this is also an another way to find the missing values in dataframe
# using data.table
sort(dt_sample$var1)
sort(dt_sample$var2, na.last = TRUE)

# odering
df_sample[order(df_sample$var1),]
dt_sample[order(var1)]
# ordering more than one collumn
df_sample[order(df_sample$var1,df_sample$var3),] # ordering based on more than two collumn
dt_sample[order(var1,var3)]

# Adding new row or collumn
df_sample$var4 <- rnorm(5)
dt_sample$var4 <- rnorm(5)

# merging two different dataframe
df_sample1 <- cbind(df_sample,rnomr(5))
df_sample2 <- rbind(df_sample,rnorm(5))


#########################################################################################
# Summarizing the data
# This is used to give a snap shot or the data summary of how the dataset looks like
# Dataset used in this: https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g
#########################################################################################

# getting the data from the web, we have already seen this in week-1
setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data/week-3/data")
if(!file.exists("./data")){dir.create("./data")}
url_link <- "https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url_link,destfile="./data/restaurants.csv",method = "curl")
data.summary <- read.csv("Restaurants.csv", header = TRUE)

# Looking at starting and ending bit of data
head(data.summary,3)
tail(data.summary,3)

# Getting the whole summary of data, cat.variable=frequency table is given, quant-quntile info given
summary(data.summary)

# Getting the variable details, explains the datatype of the variable
str(data.summary)

# Explicit Quantile information of a particular variable
quantile(data.summary$councilDistrict, rm=TRUE) # rm is used to remove any missing values/object 
# To get only the specific quantile
quantile(data.summary$councilDistrict,probs=c(0.5,0.75,0.9))

# Getting the frequency table
# for one variable
table(data.summary$zipCode, useNA = "ifany") # useNA is used to list any missing values in the data
# to create frequency tale with more than one variable
table(data.summary$councilDistrict,data.summary$zipCode)
data.table <- table(data.summary$councilDistrict,data.summary$zipCode) # this will create a table data
# can be highly used in vizualization to create the network diagram

# Check for missing values and wiered data
sum(is.na(data.summary$councilDistrict)) # if this returns 0 then no missing values 
any(is.na(data.summary$councilDistrict)) # if this returns false then no missing values
# use this technique only if you know the range of data values
all(data.summary$zipCode>0) # it should retun true, else it means there are some values which has some weared values

# to check for missing values in a consolidated manner - rowsums and colsums
colSums(is.na(data.summary))
all(colSums(is.na(data.summary))==0)

# Checking values with specific character
data.summary$zipCode %in% c('21212') #this cannot be directly used as it will return only true or false
table(data.summary$zipCode %in% c('21212')) # this will give number of rows with zipcode equal and !equal to 21212
table(data.summary$zipCode %in% c('21212','21213')) # we can combine and search with two or more values too
data.summary[data.summary$zipCode %in% c('21212'),] # used to print the values with filter in 

# Cross table or frequency table
data("UCBAdmissions")
data.df_ucb <- as.data.frame(UCBAdmissions)
summary(data.df_ucb) # we have see this before
# below is used for cross tabulation
xtabs(Freq~Gender+Admit,data=data.df_ucb)
# Flat table
cross_table <- xtabs(Freq~Gender+Admit,data=data.df_ucb)
ftable(cross_table)

# finding the size of the dataset
object.size(data.df_ucb)
print(object.size(data.df_ucb),units="Kb") #to display in other units of size "b", "auto", "Kb", "Mb", "Gb", "B", "KB", "MB", "GB"


#########################################################################################
# Creating New Variables
# At time we transform few variable to make it suitable for our analysis as raw data is not readily avaialble for analysis
# Some functions are: Missingness indicator, Cutting up Quant values and applying transform
#########################################################################################

# Creating sequence - at times it is always good to have index in your data
head(data.summary)
s1 <- seq(1,10,by=2) # this will print the sequnce of character by skipping one number in between
s2 <- seq(1,10,length=3) # Equally divide the number into 3 parts and display its sequence
s3 <- c(1,3,8,25,100); seq(along=s3) # This is used to print the sequnce of index, print the sequence

# Subsetting Variables
head(data.summary,3)
data.summary$nearme <- data.summary$neighborhood %in% c('Roland Park','Homeland')
table(data.summary$nearme)
data.summary[data.summary$nearme,] # this will print only the true values in the nearme collumn

# There are 3 major type of variables that we can create in a dataset
# 1. binay
# 2. categorical or qualitative
# 3. Quantitative using transformation

# Creating Binary Variable
data.summary$zipwrong <- ifelse(data.summary$zipCode<0,TRUE,FALSE)
table(data.summary$zipwrong)
table(data.summary$zipwrong,data.summary$zipCode<0)

# Creating categorical or qualitative variables
data.summary$zipgroup <- cut(data.summary$zipCode, breaks = quantile(data.summary$zipCode))
table(data.summary$zipgroup)
table(data.summary$zipgroup,data.summary$zipCode)
head(data.summary)
# There is a library which can ease the way we cut the data
install.packages("Hmisc")
library(Hmisc)
data.summary$zipgroup <- cut2(data.summary$zipCode,g=4) # this produces factor variable
table(data.summary$zipgroup)

# Creating the factor Variables
data.summary$zipfactor <- factor(data.summary$zipCode)
data.summary$zipfactor[1:10] # printing levels from 1 to 10
class(data.summary$zipfactor)
# Creating explicit levels in factor
factor_levels_creation <- sample(c('Yes','No'), size=10, replace=TRUE)
factor_levels <- factor(factor_levels_creation, levels=c('Yes','No'))
relevel(factor_levels, ref='Yes')
# Converting Boolean factors to numeric
as.numeric(factor_levels)

# mutate function 


# Generic Quantitative transformation in analytics
abs(data.summary$councilDistrict) # for absolute value transformation
sqrt() # Used for square root transformation
ceiling() # used to ceil the value, ceiling of 3.453 is 4, just nothing but the round of to highest integer
floor() # used to floor the value, floor of 3.453 is 3 just nothing but round of to lowest integer
round() # used to roun of to the nearesr decimal round(3.453,digits=2), rounded by two decimal
signif() # used for round off again, google for more details
cos() # used for cos tranformation
sin() # used for Sin transformation 
log() # used for log transformation, natural log, that is log base e
log2() # for log base 2 transformation
log10() # for log base 10 transformation
exp() # for exponential transformation

#########################################################################################
# Re-shaping the data
# Goal of reshaping is to convert a untidy data into a tidy data
# Each Variable form a collum, each observation form a row, each table stored data about a unique subject
#########################################################################################

# we use library reshape2 for reshaping our dataset
install.packages("reshape2")
require(reshape2)
data("mtcars")
head(mtcars)

data.mtcars <- mtcars
# Melting Data Frames
data.mtcars$carname <- rownames(data.mtcars)
carmelt <- melt(data.mtcars, id=c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
head(carmelt)
tail(carmelt)

# Casting data frame
cylData <- dcast(carmelt,cyl~variable)
cylData <- dcast(carmelt,cyl~variable,mean)

# Averaging the value
data("InsectSprays")
data.insect <- InsectSprays
head(data.insect)
tapply(data.insect$count,data.insect$spray,sum)
# Another way to split and average the value
split_ins <- split(data.insect$count,data.insect$spray)
sprcount <- lapply(split_ins,sum)
# Another way to combine
unlist(sprcount)
sapply(split_ins, sum)
# Another way through plyr package
require(plyr)
ddply(data.insect,.(spray),summarize,sum=sum(count))
# Creating new variable
spraySums <- ddply(data.insect,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)





