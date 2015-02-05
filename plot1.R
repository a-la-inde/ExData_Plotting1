## read data
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt",
                     header=TRUE,sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

## create new var

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

## change my time

Sys.setlocale("LC_TIME", "English") 

## plot1

hist(data$Global_active_power, col = "red", ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

png(filename = "plot1.png", 
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## change time back

Sys.setlocale("LC_TIME", user_lang)