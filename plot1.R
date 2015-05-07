## Read data from file and filter only the rows needed for this exercise
rawdata <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrow = 2880)
colnames(rawdata) <- colnames(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 1))

## Set output to PNG
png("plot1.png", width = 480, height = 480)

## Plot data
hist(rawdata$Global_active_power, 15, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()