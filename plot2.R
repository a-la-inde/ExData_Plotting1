## read data
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt",
                     header=TRUE,sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

## create new var

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

## change my time

Sys.setlocale("LC_TIME", "English") 

## plot2

par(mar=c(5,5,4,4))
with(data, plot(Date.Time, Global_active_power, type="l", xlab= "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()

## change time back

Sys.setlocale("LC_TIME", user_lang)