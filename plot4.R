plot4<-function(){
  electricPowerData<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = c("?","NA"," "),stringsAsFactors = FALSE)
  electricPowerData[["Date"]]<-as.Date(electricPowerData[["Date"]],"%d/%m/%Y")
  #test[["Time"]]<-as.Date(test[["Time"]],"%H:%M:%S")
  electricPowerDataSubSet<- electricPowerData[(electricPowerData[["Date"]]==as.Date("2007-02-01")| electricPowerData[["Date"]]==as.Date("2007-02-02")),]
  datetime<-strptime(paste(electricPowerDataSubSet$Date,electricPowerDataSubSet$Time),format = "%Y-%m-%d %H:%M:%S")
  png(file = "plot4.png", width = 480, height = 480, units = "px")
  par(mfrow=c(2,2))
  plot(datetime,electricPowerDataSubSet$Global_active_power,type = "l",ylab = "Global Active Power")
  plot(datetime,electricPowerDataSubSet$Voltage,type = "l",ylab = "Voltage")
  plot(datetime,electricPowerDataSubSet$Sub_metering_1,type = "l",ylab = "Energy sub metering")
  points(datetime,electricPowerDataSubSet$Sub_metering_2,type = "l",col="red")
  points(datetime,electricPowerDataSubSet$Sub_metering_3,type = "l",col="blue")
  legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),seg.len=3,lwd=1, lty=c(1,1,1),bty = "n",cex=0.75)
  plot(datetime,electricPowerDataSubSet$Global_reactive_power,type = "l",ylab = "Global_reactive_power")
  dev.off()
}