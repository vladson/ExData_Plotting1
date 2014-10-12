# Plot 1 
print("Construsting Plot3")
print("Data load and prepare")
datum <- read.table("./household_power_consumption.txt", sep=";", header=T,
              colClasses = c('character', 'character', 'numeric',
                             'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
                             'numeric'), na.strings='?')
datum$DateTime <- strptime(paste(datum$Date, datum$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(datum, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
#end common part

print("Plot creating")
# Make devise and start recording
png("plot1.png", height=480, width=480)
hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
#close devise
dev.off()
print("plot1.png written")