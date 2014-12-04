
#Read power consumption data
data <- fread("exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

#Convert character to Date and select data for the required 2 days
data$Date <- as.Date(data$Date, "%d/%m/%Y")
reqData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

#plot and save in png file
png("plot1.png", width = 480, height = 480)
par(bg = "transparent")
hist(as.numeric(reqData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

