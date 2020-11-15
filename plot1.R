#PLOT 1

library(dplyr)

hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec=".")

hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

hpc_days <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

hpc_days$Global_active_power <- as.numeric(hpc_days$Global_active_power)

hist(hpc_days$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")

dev.off()
