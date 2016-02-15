# Pre-defined classes of columns to make reading file faster */
classes <- c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# Reading data file to tabAll variable
tabAll <- read.table(file="household_power_consumption.txt", header=TRUE, colClasses=classes, sep=";", na.strings="?")

# Subsetting required data
maindata <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")
remove(tabAll)

# Saving plot to PNG file at current working directory
png("plot1.png", width=480, height=480)

# Plotting the graph
hist(maindata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

# Completing
dev.off()
remove(maindata)
