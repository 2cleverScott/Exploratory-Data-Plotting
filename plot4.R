#Plot4
### Get the Data and prep for graphing
household_power_consumption <- read.csv("~/Documents/workspace/PlottingData/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- household_power_consumption
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
plotdata <- subset(power, DateTime < as.POSIXct('2007-02-03'))
plotdata <- subset(plotdata, DateTime > as.POSIXct('2007-02-01'))
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
plotdata$Global_reactive_power <- as.numeric(plotdata$Global_reactive_power)
plotdata$Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
plotdata$Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
plotdata$Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)
plotdata$Voltage <- as.numeric(plotdata$Voltage)

#Create the 2 by 2 graph layout
par(mfrow = c(2,2))

#First Graph
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Second Graph
plot(plotdata$DateTime,plotdata$Voltage, type='n',xlab="datetime",ylab="Voltage")
lines(plotdata$DateTime,plotdata$Voltage)

#Third Graph
plot(plotdata$DateTime,plotdata$Sub_metering_1, type='n',xlab="",ylab="")
lines(plotdata$DateTime,plotdata$Sub_metering_1)
lines(plotdata$DateTime,plotdata$Sub_metering_2, col="blue")
lines(plotdata$DateTime,plotdata$Sub_metering_3, col="red")
title(ylab="Energy Sub-Metering")


#Add legend to 3rd Graph
legend("topright", pch=c(20,20,20), col=c("black","blue", "red"), legend=c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"))

# Fourth Graph 
plot(plotdata$DateTime,plotdata$Global_reactive_power, type='n',xlab="datetime",ylab="Global Reactive Power")
lines(plotdata$DateTime,plotdata$Global_reactive_power)

#Output the 4 graphs in one PNG
dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()
