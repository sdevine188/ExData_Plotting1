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

## create .png file with plot2

png("plot2.png")
par(mar = c(3, 4, 4, 2))
plot(data$date.time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

