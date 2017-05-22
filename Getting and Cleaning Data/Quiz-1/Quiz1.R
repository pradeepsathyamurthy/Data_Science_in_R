# Week-1 Quiz

# Quest-1
setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data/trail")
# Downloading the data
download_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(download_URL,destfile = "data_week1.csv")
data_quiz1 <- read.csv("data_week1.csv",header = TRUE)
str(data_quiz1$VAL)
head(data_quiz1$VAL,3)
count.prop <- data_quiz1[which(data_quiz1$VAL==24),]

# Qust-3
download_URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
install.packages("xlsx")
install.packages("openxlsx")
require(openxlsx)
data3 <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx")
data_quest3 <- read.csv("gov_NGAP.csv",header = TRUE,na.strings = NA)
sum(data_quest3$Zip*data_quest3$Ext,na.rm=T)


# Quest-4
download_URL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
require(XML)
#require(curl)
install.packages("RCurl")
require(RCurl)
URL3 <- getURL(download_URL3)
data.xml <- xmlTreeParse(URL3,useInternalNodes = TRUE)
data.root <- xmlRoot(data.xml)
xmlName(data.root)
xmlSApply(data.root,xmlValue)
zip_filtered <- xpathSApply(data.root,"//zipcode",xmlValue)
zip_filter <- which(zip_filtered=="21231")
zip_count <- length(zip_filter)
print(zip_count)

# Question-5
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url4,"quest5.csv")
data.read <- read.csv("quest5.csv")
install.packages("data.table")
require(data.table)
DT <- fread("quest5.csv")
system.time(DT[,mean(pwgtp15),by=SEX]) # True
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean)) # True
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)) #True
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)) # True
