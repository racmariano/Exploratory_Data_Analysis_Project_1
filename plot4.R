  # Note, this code could be made more succint by making function
  # calls to the other scripts we created for this exercise.
  # However, I just opted to copy-pasta.

  # Good day.

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
trueTime = paste(data$Date, data$Time)

png('plot4.png', width=480, height = 480)

par(mfcol = c(2,2))

plot(as.POSIXct(trueTime),data$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")

plot(as.POSIXct(trueTime),as.numeric(as.character(data$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(as.POSIXct(trueTime),as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(as.POSIXct(trueTime),data$Sub_metering_3,col="blue")
legend("topright", pch="-", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(as.POSIXct(trueTime),as.numeric(as.character(data$Voltage)), type="l", ylab="Voltage", xlab="datetime")

makeGraph3(filename)

plot(as.POSIXct(trueTime),as.double(as.character(data$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()


