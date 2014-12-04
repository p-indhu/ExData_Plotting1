
#Read power consumption data
data <- fread("exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

#Convert character to Date, select data for the required 2 days, merge date and time column
data$Date <- as.Date(data$Date, "%d/%m/%Y")
reqData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dateTime <- strptime(paste(reqData$Date, reqData$Time), "%Y-%m-%d %H:%M:%S") 

#plot and save in png file
png("plot2.png", width = 480, height = 480)
#par(bg = "transparent")
plot(dateTime, reqData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
