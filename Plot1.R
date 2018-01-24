Temp_consump <- file("household_power_consumption.txt")
open(Temp_consump,"r")
Hist_Data <- read.table(text = grep("^[1,2]/2/2007", readLines(Temp_consump), value = TRUE), col.names = c("Date1", "Time1", "Global_active_power", "Global-reactive-power", "Voltage1", "Global-intensity", "Submetering1", "Submetering2", "Submetering3"), sep = ";", header = TRUE)
close(Temp_consump)
png()
# Generating Plot 1
hist(Hist_Data$Global_active_power, main = paste("Global Active Power"), col = "red",xlab = "Global Active Power (kilowatts)")
dev.off()