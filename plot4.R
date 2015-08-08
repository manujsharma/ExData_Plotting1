# Read Data
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Change Date format to filter data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Extract the required data
datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Change Data format to numeric to make plot
globalActivePower <- as.numeric(datasub$Global_active_power)

# Add new column with Date and Time merged
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)

# Plot the data
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(datasub, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()