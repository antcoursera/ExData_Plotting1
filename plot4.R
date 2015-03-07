# Reading data from text
power.data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")
# Converting Date column from characters into Date type
power.data[,1] = as.Date(power.data[,1],format="%d/%m/%Y")
# Subsetting required dates
power.data <- subset(power.data, Date == "2007-02-01" | Date == "2007-02-02")
# Creating a date-time column
power.data$DateTime <- as.POSIXct(paste(power.data$Date, power.data$Time), format="%Y-%m-%d %H:%M:%S")
# Opening output for plotting
png("plot4.png")
# Setting up canvas for 2x2 subplots 
par(mfrow=c(2, 2))
# Drawing plot 1
plot(power.data$DateTime, power.data$Global_active_power, ylab="Global Active Power", xlab="", type="l")
# Drawing plot 2
plot(power.data$DateTime, power.data$Voltage, ylab="Voltage", xlab="datetime", type="l")
# Drawing plot 3 without lines
plot(power.data$DateTime, power.data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
# Lines for plot 3 
lines(power.data$DateTime, power.data$Sub_metering_1)
lines(power.data$DateTime, power.data$Sub_metering_2, col="red")
lines(power.data$DateTime, power.data$Sub_metering_3, col="blue")
# Legend for plot 3 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,lty=1, col=c("black","red","blue"),bty="n",cex=0.94)
# Drawing plot 4
plot(power.data$DateTime, power.data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()