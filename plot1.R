#Plot 1
####
household_power_consumption <- read.csv("~/Documents/workspace/PlottingData/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- household_power_consumption
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
plotdata <- subset(power, DateTime < as.POSIXct('2007-02-03'))
plotdata <- subset(plotdata, DateTime > as.POSIXct('2007-02-01'))
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
#Build Histogram
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

###Create the PNG file
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()
