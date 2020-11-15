#PLOT 4 

hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec=".")

hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

hpc_days <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

hpc_days$DateTime <- with(hpc_days, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

par(mfrow = c(2,2))
with(hpc_days, {
  plot(DateTime, Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(DateTime, Voltage, type= "l", ylab= "Voltage")
  plot(DateTime, Sub_metering_1, xlab= "", ylab = "Energy sub metering", type = "n")
  points(DateTime, Sub_metering_1, type = "l")
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  points(DateTime, Sub_metering_3, type = "l", col = "blue") 
  legend("topright", lty = 1:1, lwd = 1, col = c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l")
}
)


