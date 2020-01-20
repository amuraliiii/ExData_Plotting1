library("data.table")

#read data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter data
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
FilteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
datetime <- strptime(paste(FilteredData$Date, FilteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert to numeric
lobalactivepower <- as.numeric(FilteredData$Global_active_power)
#plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()