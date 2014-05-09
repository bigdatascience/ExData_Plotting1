power <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]
hist(as.numeric(powerDate$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
