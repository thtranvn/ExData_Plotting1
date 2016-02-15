# Pre-defined classes of columns to make reading file faster */
classes <- c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# Reading data file to tabAll variable
tabAll <- read.table(file="household_power_consumption.txt", header=TRUE, colClasses=classes, sep=";", na.strings="?")

# Subsetting required data
maindata <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")
remove(tabAll)

# Merge Date and Time columns to convert to POSIXlt POSIXt
maindata$DateTime <- strptime(paste(maindata$Date,maindata$Time), "%d/%m/%Y %H:%M:%S")

# Saving plot to PNG file at current working directory
png("plot4.png", width=480, height=480)

# Setting frame 2x2
par(mfrow=c(2,2))

############ Plotting the graph ###############
# First plot
with(maindata, plot(DateTime, Global_active_power,type="l", xlab="", ylab="Global Active Power"))

# Second plot
with(maindata, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# Third plot
with(maindata, plot(DateTime, Sub_metering_1 ,type="l", xlab="", ylab="Enery sub metering"))
with(maindata, lines(DateTime, Sub_metering_2, col="red" ,type="l"))
with(maindata, lines(DateTime, Sub_metering_3, col="blue" ,type="l"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

# Forth plot
with(maindata, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power"))

#################################################

# Completing
dev.off()
remove(maindata)