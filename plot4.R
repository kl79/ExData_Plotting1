makeplot4 <- function()
{
	## read data
	data <- read.csv("../household_power_consumption.txt", sep=";")
	subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

	## convert to numeric
	subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
	subdata$Global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))
	subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
	subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
	subdata$Voltage <- as.numeric(as.character(subdata$Voltage))

	## convert date+time to datetime
	subdata$datetime <- as.POSIXct(strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S"))

	## construct plot + save to PNG
	png("plot4.png")
	par (mfrow= c (2,2))

	## 1st plot
	plot(subdata$Global_active_power ~ subdata$datetime, type = "l", ylab = "Global Active Power", xlab = "")

	## 2nd plot
	plot(subdata$Voltage ~ subdata$datetime, type = "l", ylab = "Voltage", xlab = "datetime")

	## 3rd plot
	plot(subdata$Sub_metering_1 ~ subdata$datetime, type="l", xlab="", ylab="Energy sub metering")
	lines(subdata$Sub_metering_2 ~ subdata$datetime, col="red")
	lines(subdata$Sub_metering_3 ~ subdata$datetime, col="blue")
	legend("topright", names(subdata)[7:9], col=c("black", "red", "blue"), lty=1, bty='n', cex=.95)

	## 4th plot
	plot(subdata$Global_reactive_power ~ subdata$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

	dev.off()
}



