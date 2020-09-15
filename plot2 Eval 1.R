#Plot 2
power_consumption1 <- data.table::fread(input = "./data/household_power_consumption.txt", na.strings="?")
power_consumption1[,Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power_consumption1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power_consumption1 <- power_consumption1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width = 480, height = 480)
plot(x = power_consumption1[,dateTime],
     y =power_consumption1[, Global_active_power],
     type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()