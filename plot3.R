## read data
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt",
                     header=TRUE,sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

## create new var

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

## change my time

Sys.setlocale("LC_TIME", "English") 

## plot3

with(data, {
  plot(Date.Time, data$Sub_metering_1, type ="l", col = "purple", 
       ylab = "Energy sub metering", xlab = NA)
  lines (Date.Time, data$Sub_metering_2, col="red")
  lines (Date.Time, data$Sub_metering_3, col = "blue")
  legend ("topright", pch = "_", col = c("purple", "red", "blue"), 
          legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
})

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()

## change time back

Sys.setlocale("LC_TIME", user_lang)







