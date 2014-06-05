# working directory is 'ExData_Plotting1/'
# data is in working directory
epc <- read.csv('household_power_consumption.txt', sep=';')
epc <- epc[epc$Date=='2/2/2007' | epc$Date=='1/2/2007',]
epc$DateTime <- as.POSIXlt(paste(epc$Date, epc$Time), format='%d/%m/%Y %H:%M:%S')

# suppressing warnings because ?'s are casted to NAs
epc$Global_active_power <- suppressWarnings(as.numeric(as.character(epc$Global_active_power)))

png(filename='plots/plot2.png', width=480, height=480)
with(epc, plot(DateTime, Global_active_power, type='l', xlab='', ylab='Glibal Active Power (kilowatts)'))
dev.off()