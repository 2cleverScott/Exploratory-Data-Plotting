#Plot 2
### Get the Data and prep for graphing
household_power_consumption <- read.csv("~/Documents/workspace/PlottingData/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- household_power_consumption
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
plotdata <- subset(power, DateTime < as.POSIXct('2007-02-03'))
plotdata <- subset(plotdata, DateTime > as.POSIXct('2007-02-01'))
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)

#Build the Line Plot
plot(plotdata$DateTime, plotdata$Global_active_power, type="n", xlab="", ylab="")
with(plotdata, lines(DateTime,Global_active_power))
title(ylab="Global Active Power (kilowatts)")

###Create the PNG file
dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()
