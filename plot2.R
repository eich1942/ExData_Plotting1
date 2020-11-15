#PLOT 2

library(dplyr)

hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec=".")

hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")
 
hpc_days <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

hpc_days$DateTime <- with(hpc_days, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

with(hpc_days, plot(DateTime, Global_active_power, type= "l", ylab= "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")

dev.off()