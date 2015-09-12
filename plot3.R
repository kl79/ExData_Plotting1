makeplot3 <- function()
{
	# read data
	data <- read.csv("../household_power_consumption.txt", sep=";")
	subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

	## convert to numeric
	subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
	subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))

	## convert date+time to datetime
	subdata$datetime <- as.POSIXct(strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S"))

	# construct plot + save to PNG
	png("plot3.png")
	plot(subdata$Sub_metering_1 ~ subdata$datetime, type="l", xlab="", ylab="Energy sub metering")
	lines(subdata$Sub_metering_2 ~ subdata$datetime, col="red")
	lines(subdata$Sub_metering_3 ~ subdata$datetime, col="blue")
	legend("topright", names(subdata)[7:9], col=c("black", "red", "blue"), lty=1)
	dev.off()
}