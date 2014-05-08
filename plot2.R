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

# Create plot 2

# Define graphic device
png("plot2.png", width = 480, height = 480)

# Generate plot
with (data, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab=0.75, cex.axis=0.75))

# turn off graphics device
dev.off()




