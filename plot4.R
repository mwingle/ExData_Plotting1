source("processData.R")

p <- processData()

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

plot(p$Datetime, p$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(p$Datetime, p$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(p$Datetime, p$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(p$Datetime, p$Sub_metering_2, col="red")
lines(p$Datetime, p$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, box.lty=0)

plot(p$Datetime, p$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()

