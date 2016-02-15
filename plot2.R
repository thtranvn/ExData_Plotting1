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
png("plot2.png", width=480, height=480)

# Plotting the graph
with(maindata, plot(DateTime, Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Completing
dev.off()
remove(maindata)