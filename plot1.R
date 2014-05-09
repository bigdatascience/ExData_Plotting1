## Read Power Date File an assign to a variable
power <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Convert Date data to Date format and subset Power data for necessary dates
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]

## Plot histogram to a PNG file
png(filename="plot1.png")
hist(as.numeric(powerDate$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
