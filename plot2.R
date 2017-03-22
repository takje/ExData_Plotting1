library(data.table)

## extract column names
XtractName <- fread("household_power_consumption.txt", nrows = 0)
nameHPC <- names(XtractName)

## read only the required rows from file
DT_HPC <- fread("household_power_consumption.txt", skip = 66637, col.names = nameHPC, nrows = 2880, na.strings = "?")

## joint columns Date and Time into one
DT_HPC$DaTm <- paste(DT_HPC$Date, DT_HPC$Time)

## save plot as png
png("plot2.png", width = 480, height = 480)
plot(strptime(DT_HPC$DaTm, "%d/%m/%Y %H:%M:%S"), DT_HPC$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()