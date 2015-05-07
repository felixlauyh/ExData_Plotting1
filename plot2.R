## Read data from file and filter only the rows needed for this exercise
rawdata <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrow = 2880, stringsAsFactors = FALSE)
colnames(rawdata) <- colnames(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 1))

## Convert Date and Time to true date time values
rawdata$Datetime <- strptime(paste(rawdata$Date, rawdata$Time), "%d/%m/%Y %H:%M:%S", tz = "CET")

## Set output to PNG
png("plot2.png", width = 480, height = 480)

## Plot data
plot(rawdata[c("Datetime", "Global_active_power")], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()