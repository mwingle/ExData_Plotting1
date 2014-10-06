source("processData.R")
p <- processData()

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(p$Datetime, p$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)

dev.off()

