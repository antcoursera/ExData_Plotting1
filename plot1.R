data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")
data[,1] = as.Date(data[,1],format="%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()