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

## Plot 1
png("plot1.png", height=480, width=480)
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col=2)
dev.off()