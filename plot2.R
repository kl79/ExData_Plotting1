makeplot2 <- function()
{
	# read data
	data <- read.csv("../household_power_consumption.txt", sep=";")
	subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

	## convert to numeric
	subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

	## convert date+time to datetime
	subdata$datetime <- as.POSIXct(strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S"))

	# construct plot + save to PNG
	png("plot2.png")
	plot(subdata$Global_active_power ~ subdata$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
	dev.off()
}
