## Read data from file and filter only the rows needed for this exercise
rawdata <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrow = 2880, stringsAsFactors = FALSE)
colnames(rawdata) <- colnames(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 1))

## Convert Date and Time to true date time values
rawdata$datetime <- strptime(paste(rawdata$Date, rawdata$Time), "%d/%m/%Y %H:%M:%S", tz = "CET")

## Set output to PNG
png("plot4.png", width = 480, height = 480)

## Configure 2 x 2 plot
par(mfrow=c(2,2))

## Generate top left plot - this is copied from plot2.R
plot(rawdata[c("datetime", "Global_active_power")], type = "l", xlab = "", ylab = "Global Active Power")

## Generate top right plot
plot(rawdata[c("datetime", "Voltage")], type = "l")

## Generae bottom left plot - this is copied from plot3.R
plot(rawdata[c("datetime", "Sub_metering_1")], type = "l", xlab = "", ylab = "Energy sub metering")
lines(rawdata[c("datetime", "Sub_metering_2")], col = "red")
lines(rawdata[c("datetime", "Sub_metering_3")], col = "blue")
legend("topright", bty = "n", lwd = 2, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Generate bottom right plot
plot(rawdata[c("datetime", "Global_reactive_power")], type = "l")

dev.off()