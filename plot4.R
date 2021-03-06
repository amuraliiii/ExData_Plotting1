library("data.table")

#read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
FilteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 1
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
datetime <- strptime(paste(FilteredData$Date, FilteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert to numeric
globalactivepower <- as.numeric(FilteredData$Global_active_power)
submeter_1 <- as.numeric(FilteredData$Sub_metering_1)
submeter_2 <- as.numeric(FilteredData$Sub_metering_2)
submeter_3 <- as.numeric(FilteredData$Sub_metering_3)
global_reactive_power <- as.numeric(FilteredData$Global_reactive_power)
voltage <- as.numeric(FilteredData$Voltage)


#plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter_2, type="l", col="red")
lines(datetime, submeter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()