## read data into R

mydata <- read.table("household_power_consumption.txt", sep = ";")

## create column names

names <- mydata[1, ]
names2 <- lapply(names, FUN = toString)
colnames(mydata) <- names2

## change Date column to date format

mydata$Date <- as.Date(mydata$Date, format = '%d/%m/%Y')

## limit data to only observations from 2007-07-01 and 2007-07-02

data <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02", ]

## create .png file with plot1

png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

