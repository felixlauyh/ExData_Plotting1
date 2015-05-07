## Read data from file and filter only the rows needed for this exercise
rawdata <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrow = 2880, stringsAsFactors = FALSE)
colnames(rawdata) <- colnames(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 1))

## Convert Date and Time to true date time values
rawdata$Datetime <- strptime(paste(rawdata$Date, rawdata$Time), "%d/%m/%Y %H:%M:%S", tz = "CET")

## Set output to PNG
png("plot3.png", width = 480, height = 480)

## Plot the data
plot(rawdata[c("Datetime", "Sub_metering_1")], type = "l", xlab = "", ylab = "Energy sub metering")
lines(rawdata[c("Datetime", "Sub_metering_2")], col = "red")
lines(rawdata[c("Datetime", "Sub_metering_3")], col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()