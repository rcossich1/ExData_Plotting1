## Coursera/Exploratory Data Analysis/Week 1 Assignment 
## file to create plot #2

library(dplyr)
library()
## opening file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dir.create(paste0(getwd(),"/data"),mode = "0777", showWarnings = TRUE)
download.file(url, destfile = "./data/hhpc.zip", method = 'curl')
unzip(zipfile="./data/hhpc.zip", exdir = "./data")
info <- read.table("./data/household_power_consumption.txt",header=TRUE, sep = ";")
## subsetting dates
info_dates <- subset(info, Date=="1/2/2007"|Date=="2/2/2007")

## converting time and date strptime()  and as.Date() functions
info_dates <- as_tibble(info_dates) 
info_dates<- mutate(info_dates, DateTime= strptime( paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))

## graph
png("plot2.png")
plot(info_dates$DateTime, 
     info_dates$Global_active_power,xlab='', ylab='Global Active Power (kilowatts)', type = 'n')
lines(info_dates$DateTime, info_dates$Global_active_power)
dev.off()