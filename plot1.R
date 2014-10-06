source("processData.R")
p <- processData()

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(p$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()