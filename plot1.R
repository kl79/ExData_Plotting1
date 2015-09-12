makeplot1 <- function()
{
	# read data
	data <- read.csv("../household_power_consumption.txt", sep=";")
	subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

	# convert to numeric
	subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

	# construct plot + save to PNG
	png("plot1.png")
	hist(subdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
	dev.off()
}

