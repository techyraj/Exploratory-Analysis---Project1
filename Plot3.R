Temp_consump <- file("household_power_consumption.txt")
open(Temp_consump,"r")
Hist_Data <- read.table(text = grep("^[1,2]/2/2007", readLines(Temp_consump), value = TRUE), col.names = c("Date1", "Time1", "Global_active_power", "Global-reactive-power", "Voltage1", "Global-intensity", "Submetering1", "Submetering2", "Submetering3"), sep = ";", header = TRUE)
close(Temp_consump)

Hist_Data$Date1<-as.Date(Hist_Data$Date1,format="%d/%m/%Y")

## Converting dates
Hist_Data$Datetime <- paste(as.Date(Hist_Data$Date1), Hist_Data$Time1)
#head(datetime)
Hist_Data$Datetime <- as.POSIXct(Hist_Data$Datetime)
#Plotting base values
png()
plot(Hist_Data$Submetering1~Hist_Data$Datetime,type = "l",xlab="")
#adding line to the base plot
lines(Hist_Data$Submetering2~Hist_Data$Datetime,col="red")
#adding another line to the base plot
lines(Hist_Data$Submetering3~Hist_Data$Datetime,col="blue")
legend("topright", col=c("black","red","blue"), lty = c(1,1), lwd = c(2.5,2.5), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()