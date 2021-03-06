# Unzipping the file# Unzipping the file 
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

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


# Substting the data for first and second of Feburary
subdata <- subset(data, data$Date=="2007-02-01" | data$Date =="2007-02-02")
options(scipen = 9)
# Creating the first plot
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", border = "black")
dev.off()
