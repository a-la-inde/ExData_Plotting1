## read data
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt",
                     header=TRUE,sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

## create new var

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

## change my time

Sys.setlocale("LC_TIME", "English") 

## plot4

par(mfrow = c(2, 2))
par(mar = c(4,4,4,4))
plot(data$Date.Time, data$Global_active_power, type="l", xlab= "", ylab = "Global Active Power")
plot(data$Date.Time, data$Voltage, type="l", xlab= "datetime", ylab = "Voltage")
plot(data$Date.Time, data$Sub_metering_1, type ="l", col = "purple", 
     ylab = "Energy sub metering", xlab = NA)
lines (data$Date.Time, data$Sub_metering_2, col="red")
lines (data$Date.Time, data$Sub_metering_3, col = "blue")
legend ("topright", pch = "_", col = c("purple", "red", "blue"), cex = 0.6, 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Date.Time, data$Global_reactive_power, type="l", xlab= "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off()

## change time back

Sys.setlocale("LC_TIME", user_lang)