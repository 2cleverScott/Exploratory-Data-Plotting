#Plot3
### Get the Data and prep for graphing
household_power_consumption <- read.csv("~/Documents/workspace/PlottingData/household_power_consumption.txt", sep=";")
power <- household_power_consumption
power$DateTime <- paste(power$Date, power$Time)
plotdata <- subset(power, DateTime < as.POSIXct('2007-02-03'))
plotdata <- subset(plotdata, DateTime > as.POSIXct('2007-02-01'))
plotdata$Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
plotdata$Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
plotdata$Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)

#Produce the multivariate Graph starting with empty plot then building in the 
# 3 lineplots
plot(plotdata$DateTime,plotdata$Sub_metering_1, type='n',xlab="",ylab="")
lines(plotdata$DateTime,plotdata$Sub_metering_1)
lines(plotdata$DateTime,plotdata$Sub_metering_2, col="blue")
lines(plotdata$DateTime,plotdata$Sub_metering_3, col="red")
title(ylab="Energy Sub-Metering")
#Add legend
legend("topright", pch=c(20,20,20), col=c("black","blue", "red"), legend=c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"))

# Create PNG File
dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()
