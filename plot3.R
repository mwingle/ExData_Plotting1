source("processData.R")
p <- processData()

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(p$Datetime, p$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(p$Datetime, p$Sub_metering_2, col="red")
lines(p$Datetime, p$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()

