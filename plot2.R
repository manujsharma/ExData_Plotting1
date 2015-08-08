# Read Data
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Change Date format to filter data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Extract the required data
datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Add new column with Date and Time merged
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)

# Plot the data
plot(datasub$Global_active_power~datasub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
