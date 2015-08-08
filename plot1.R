# Read Data
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Change Date format to filter data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Extract the required data
datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Change Data format to numeric to make plot
globalActivePower <- as.numeric(datasub$Global_active_power)

# Plot the data
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
