library("data.table")

#read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
FilteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 1
globalactivepower <- as.numeric(FilteredData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

