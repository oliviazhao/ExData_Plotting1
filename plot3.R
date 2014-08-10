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

## Plot 3
attach(data1)
png("plot3.png", height=480, width=480)
plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1)
dev.off()

