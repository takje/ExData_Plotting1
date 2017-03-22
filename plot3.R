library(data.table)

## extract column names
XtractName <- fread("household_power_consumption.txt", nrows = 0)
nameHPC <- names(XtractName)

## read only the required rows from file
DT_HPC <- fread("household_power_consumption.txt", skip = 66637, col.names = nameHPC, nrows = 2880, na.strings = "?")

## joint columns Date and Time into one
DT_HPC$DaTm <- paste(DT_HPC$Date, DT_HPC$Time)

## save plot as png
png("plot3.png", width = 480, height = 480)
plot(strptime(DT_HPC$DaTm, "%d/%m/%Y %H:%M:%S"), DT_HPC$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")     
lines(strptime(DT_HPC$DaTm, "%d/%m/%Y %H:%M:%S"), DT_HPC$Sub_metering_2, type = "l", col = "#f72b07")
lines(strptime(DT_HPC$DaTm, "%d/%m/%Y %H:%M:%S"), DT_HPC$Sub_metering_3, type = "l", col = "#1858bf")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "#f72b07", "#1858bf"))
dev.off()