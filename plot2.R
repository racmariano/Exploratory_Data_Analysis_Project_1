data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
trueTime = paste(data$Date, data$Time)

png('plot2.png', width=480, height = 480)

plot(as.POSIXct(trueTime),data$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")

dev.off()
