# Plot 3 
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
png("plot3.png", height=480, width=480)
with(data, {
  plot(DateTime, Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_1)
  lines(DateTime, Sub_metering_2, col='red')
  lines(DateTime, Sub_metering_3, col='blue')
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty = c(1,1,1))
})
dev.off()
print("plot3.png written")