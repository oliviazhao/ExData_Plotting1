## Read full dataset
setwd("/Users/olivia/Documents/COURSE")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 stringsAsFactors=F, quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
head(data)

## Subset the data
data1 <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(data)

## Convert dates
data1$Datetime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))

## Plot 2
attach(data1)
png("plot2.png", height=480, width=480)
plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()