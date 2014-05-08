#load full data set
full_data <- read.table('./household_power_consumption.txt',
                        #nrows = 1000,
                        #skip = 22000,
                        header = TRUE,
                        sep = ";",
                        na.strings = '?',
                        stringsAsFactors=FALSE,
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

# subset full data set.  Get rows corresponding to Feb 1-2, 2007
data <- full_data[(full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"),]

# Convert Time column to datetime type
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# Convert Date column to date type
data$Date <- strptime(data$Date,format="%d/%m/%Y")

str(data)

# remove full data set from memory
rm(full_data)

# Create plot 4

# Define graphic device
png("plot4.png", width = 480, height = 480)

# specify layout
par(mfrow = c(2,2))

# Generate plot 1
with (data, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Generate plot 2
with (data, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Generate plot 3 - base plot
with(data, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
# plot 3 line 1
with(data, lines(Time, Sub_metering_1))
# plot 3 line 2
with(data, lines(Time, Sub_metering_2, col = "red"))
# plot 3 line 3
with(data, lines(Time, Sub_metering_3, col = "blue"))
# plot 3 legend
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, bty="n")

# Generate plot 4
with (data, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

# turn off graphics device
dev.off()



