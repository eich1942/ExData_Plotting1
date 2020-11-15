#PLOT 3 

library(dplyr)

hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec=".")

hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

hpc_days <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

hpc_days$DateTime <- with(hpc_days, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

with(hpc_days, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", type = "n"))

with(hpc_days, points(DateTime, Sub_metering_1, type = "l"))

with(hpc_days, points(DateTime, Sub_metering_2, type = "l", col = "red"))

with(hpc_days, points(DateTime, Sub_metering_3, type = "l", col = "blue"))

legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")

dev.off()
     
     