
#Read power consumption data
data <- fread("exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

#Convert character to Date, select data for the required 2 days, merge date and time column
data$Date <- as.Date(data$Date, "%d/%m/%Y")
reqData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dateTime <- strptime(paste(reqData$Date, reqData$Time), "%Y-%m-%d %H:%M:%S") 

#plot and save in png file
png("plot4.png", width = 480, height = 480)
par(bg = "transparent")
par(mfrow = c(2,2))

plot(dateTime, reqData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(dateTime, reqData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(dateTime, reqData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(dateTime, reqData$Sub_metering_2, type = "l", col = "red")
points(dateTime, reqData$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), xjust = 0, yjust = 0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lty = 0)

plot(dateTime, reqData$Global_reactive_power, xlab = "datetime", ylab = "Global_Reactive_Power", type = "l")

dev.off()
