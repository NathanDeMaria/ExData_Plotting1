# working directory is 'ExData_Plotting1/'
# data is in working directory
epc <- read.csv('household_power_consumption.txt', sep=';')
epc <- epc[epc$Date=='2/2/2007' | epc$Date=='1/2/2007',]
epc$DateTime <- as.POSIXlt(paste(epc$Date, epc$Time), format='%d/%m/%Y %H:%M:%S')

# suppressing warnings because ?'s are casted to NAs
epc$Global_active_power <- suppressWarnings(as.numeric(as.character(epc$Global_active_power)))
epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))

png(filename='plots/plot3.png', width=480, height=480)
with(epc, plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black'))
with(epc, points(DateTime, Sub_metering_2, type='l', col='red'))
with(epc, points(DateTime, Sub_metering_3, type='l', col='blue'))
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty=1)
dev.off()