library(data.table)

## extract column names
XtractName <- fread("household_power_consumption.txt", nrows = 0)
nameHPC <- names(XtractName)

## read only the required rows from file
DT_HPC <- fread("household_power_consumption.txt", skip = 66637, col.names = nameHPC, nrows = 2880, na.strings = "?")

## save plot as png
png("plot1.png", width = 480, height = 480)
hist(DT_HPC$Global_active_power, main = "Global Activity Power", xlab = "Global Activity Power (kilowatts)", col = "#f72b07")
dev.off()
