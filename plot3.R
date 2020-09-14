## Coursera/Exploratory Data Analysis/Week 1 Assignment 
## file to create plot #3

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
info_dates <- mutate(info_dates, Sub_metering_1=as.numeric(Sub_metering_1))
info_dates <- mutate(info_dates, Sub_metering_2=as.numeric(Sub_metering_2))
info_dates <- mutate(info_dates, Sub_metering_3=as.numeric(Sub_metering_3))
## graph
png("plot3.png")
plot(info_dates$DateTime, 
     info_dates$Sub_metering_1,xlab='', ylab='Energy sub metering', type = 'n')
lines(info_dates$DateTime, info_dates$Sub_metering_1)
lines(info_dates$DateTime, info_dates$Sub_metering_2, col='red')
lines(info_dates$DateTime, info_dates$Sub_metering_3, col='blue')
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.width = strwidth("XXXXXXXXXXX"),
       lty = 1, xjust = 0, yjust = 0, col = c('black','red','blue'))
dev.off()

