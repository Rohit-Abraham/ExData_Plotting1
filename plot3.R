# Unzipping the file# Unzipping the file 
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Creating a column with both date and time
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

# Setting correct date-time format
data$Date <- as.Date(data$Date , format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Subsetting the data for first two days of Feburary
subdata2 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Creating the plot
png("plot3.png", width = 480, height = 480)
with(subdata2, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
lines(subdata2$datetime, subdata2$Sub_metering_2, type = "l", col = "red")
lines(subdata2$datetime, subdata2$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, 
       col = c("black", "red", "blue"))
dev.off()
