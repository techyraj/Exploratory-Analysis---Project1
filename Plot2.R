Temp_consump <- file("household_power_consumption.txt")
open(Temp_consump,"r")
#reading only two days data from the file.
Hist_Data <- read.table(text = grep("^[1,2]/2/2007", readLines(Temp_consump), value = TRUE), col.names = c("Date1", "Time1", "Global_active_power", "Global-reactive-power", "Voltage1", "Global-intensity", "Submetering1", "Submetering2", "Submetering3"), sep = ";", header = TRUE)
close(Temp_consump)
Hist_Data$Date1<-as.Date(Hist_Data$Date1,format="%d/%m/%Y")
# adding date and time together
Hist_Data$Datetime <- paste(Hist_Data$Date1, Hist_Data$Time1)
  Hist_Data$Datetime <- as.POSIXct(Hist_Data$Datetime)

png()
# Generating Plot between date and Global Active power
plot(Hist_Data$Datetime, Hist_Data$Global_active_power,
    ylab = "Global Active Power (kilowatts)", type = "l",xlab="")
dev.off()