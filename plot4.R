## 
##  Plot 4
##

## Read Power Date File an assign to a variable
power <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Convert Date data to Date format and subset Power data for necessary dates
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]
DT <- strptime(paste(powerDate$Date,powerDate$Time),format="%Y-%m-%d %H:%M:%S")
powerDate <- cbind(powerDate,DT)

## Plot histogram to a PNG file
png(filename="plot4.png")
par(mfrow = c(2,2))
plot(powerDate$DT,powerDate$Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot(powerDate$DT,powerDate$Voltage, type="l",ylab="Voltage",xlab="")
##plot(powerDate$DT,powerDate$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(powerDate$DT,powerDate$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="", col="black")
points(powerDate$DT,powerDate$Sub_metering_2, xlab="", col="red", type="l")
points(powerDate$DT,powerDate$Sub_metering_3, xlab="", col="blue", type="l")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty="solid", border="white")
plot(powerDate$DT,powerDate$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="")
dev.off()
