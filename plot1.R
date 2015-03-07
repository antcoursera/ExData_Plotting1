# Reading data from text
power.data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")
# Converting Date column from characters into Date type
power.data[,1] = as.Date(power.data[,1],format="%d/%m/%Y")
# Subsetting required dates
power.data <- subset(power.data, Date == "2007-02-01" | Date == "2007-02-02")
# Opening output for plotting
png("plot1.png")
# Drawing plot
hist(power.data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Closing output
dev.off()