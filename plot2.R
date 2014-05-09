## 
##  Plot 2
##

## Read Power Date File an assign to a variable
power <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Convert Date data to Date format and subset Power data for necessary dates
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]
DT <- strptime(paste(powerDate$Date,powerDate$Time),format="%Y-%m-%d %H:%M:%S")
powerDate <- cbind(powerDate,DT)

## Plot histogram to a PNG file
png(filename="plot2.png")
plot(pd$DT,pd$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
