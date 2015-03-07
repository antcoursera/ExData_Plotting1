# Reading data from text
power.data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")
# Converting Date column from characters into Date type
power.data[,1] = as.Date(power.data[,1],format="%d/%m/%Y")
# Subsetting required dates
power.data <- subset(power.data, Date == "2007-02-01" | Date == "2007-02-02")
# Creating a date-time column
power.data$DateTime <- as.POSIXct(paste(power.data$Date, power.data$Time), format="%Y-%m-%d %H:%M:%S")
# Opening output for plotting
png("plot2.png")
# Drawing plot
plot(power.data$DateTime, power.data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
# Closing output
dev.off()