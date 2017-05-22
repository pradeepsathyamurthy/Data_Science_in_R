setwd("D:/Courses/Coursera/Data Science/Getting and Cleaning Data/week-4/data")
if(!file.exists("./data")){dir.create("./data")}
url_link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url_link,destfile="./data/communities.csv",method = "curl")
data.summary <- read.csv("communities.csv", header = TRUE)
names(data.summary)
split.names <- strsplit(names(data.summary),split = "wgtp")
split.names[[123]]

# Question-2
url_link2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url_link2,destfile="./gdp.csv",method = "curl")
data.summary <- read.csv("gdp.csv", header = TRUE)
tail(data.summary)

# Question-4
url_link3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url_link3,destfile="./fgdp.csv",method = "curl")
data.fgdp <- read.csv("fgdp.csv", header = TRUE)
head(data.fgdp)

url_link4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url_link4,destfile="./fedstats.csv",method = "curl")
data.fedstats <- read.csv("fedstats.csv", header = TRUE)
head(data.fgdp)
tail(data.fgdp)

# Qustion-5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)





