plot2<-function(){
  electricPowerData<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = c("?","NA"," "),stringsAsFactors = FALSE)
  electricPowerData[["Date"]]<-as.Date(electricPowerData[["Date"]],"%d/%m/%Y")
  #test[["Time"]]<-as.Date(test[["Time"]],"%H:%M:%S")
  electricPowerDataSubSet<- electricPowerData[(electricPowerData[["Date"]]==as.Date("2007-02-01")| electricPowerData[["Date"]]==as.Date("2007-02-02")),]
  datetime<-strptime(paste(electricPowerDataSubSet$Date,electricPowerDataSubSet$Time),format = "%Y-%m-%d %H:%M:%S")
  png(file = "plot2.png", width = 480, height = 480, units = "px")
  plot(datetime,electricPowerDataSubSet$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)")
  dev.off()
}