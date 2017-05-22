setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data/week-3/data")
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#if(!dir.exists("./data")){dir.create("./data")}
download.file(link,destfile = "week3_1.csv",method = "curl")
data.survey <- read.csv("week3_1.csv",header = TRUE)
head(data.survey,1)

# Question-1
# ACR is the lot size, AGS for Sales for Agricultural Products
# Algorithm:
# Apply filter on ACR where ACR=3
# Apply filter on AGS where AGS=6


# Question-2
install.packages("jpeg")
require(jpeg)
data.image <- readJPEG("getdata_jeff.jpg",native = TRUE)
head(data.image)
quantile(data.image,probs = c(0.3,0.8))


# Question-3
# Algorithm
# Download the file gdp and then the another file
# Clean the data and get only the data of interest
# 

data.gdp <- read.csv("week3_created.csv",header = TRUE)
head(data.gdp)
str(data.gdp)
quantile(data.gdp$Ranking,na.rm = TRUE)
table(quantile(data.gdp$Ranking,na.rm = TRUE))
