## read data into R

mydata <- read.table("household_power_consumption.txt", sep = ";")

## create column names

names <- mydata[1, ]
names2 <- lapply(names, FUN = toString)
colnames(mydata) <- names2

## change Date column to date format

mydata$Date <- as.Date(mydata$Date, format = '%d/%m/%Y')

## change Time column to time format

mydata$Time <- as.Date(mydate$Time, format = "%H%M%S")

## limit data to only observations from 2007-07-01 and 2007-07-02

data <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02", ]

## create date.time column based on Date and Time columns

data$Time <- as.character(data$Time)
data$date.time <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## convert Sub_metering, Voltage, and Global columns from factors to numeric
data$sub.metering.1 <- as.character(data$Sub_metering_1)
data$sub.metering.1 <- as.numeric(data$sub.metering.1)

data$sub.metering.2 <- as.character(data$Sub_metering_2)
data$sub.metering.2 <- as.numeric(data$sub.metering.2)

data$sub.metering.3 <- as.character(data$Sub_metering_3)
data$sub.metering.3 <- as.numeric(data$sub.metering.3)

data$voltage <- as.character(data$Voltage)
data$voltage <- as.numeric(data$voltage)

data$global.reactive.power <- as.character(data$Global_reactive_power)
data$global.reactive.power <- as.numeric(data$global.reactive.power)

## create .png file with plot2

png("plot4.png")
par(mfcol = c(2, 2))

par(mar = c(3, 4, 4, 0))
plot(data$date.time, data$Global_active_power, type = "l", ylab = "Global Active Power")


ymax <- max(data$sub.metering.1, data$sub.metering.2, data$sub.metering.3)
plot(data$date.time, data$sub.metering.1, type = "l", ylab = "Energy sub metering", ylim = c(0, ymax))
lines(data$date.time, data$sub.metering.2,type = "l", col = "red")
lines(data$date.time, data$sub.metering.3,type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1), col = c("black", "red", "blue")) 


par(mar = c(5, 4, 4, 2))
plot(data$date.time, data$voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$date.time, data$global.reactive.power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
