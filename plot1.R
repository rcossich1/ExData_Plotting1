## Coursera/Exploratory Data Analysis/Week 1 Assignment 
## file to create plot #1
library(dplyr)
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
info_dates <- mutate(info_dates,Date=as.Date(Date)) 
info_dates <- mutate(info_dates, Time=strptime(info_dates$Time, format = "%H:%M:%S"))
info_dates <- mutate(info_dates, Global_active_power=as.numeric(Global_active_power))

## graph
png("plot1.png")
hist(info_dates$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main =  'Global Active Power')
dev.off()
