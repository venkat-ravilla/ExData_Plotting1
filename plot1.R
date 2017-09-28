plot1<-function(){
  electricPowerData<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings = c("?","NA"," "),stringsAsFactors = FALSE)
  electricPowerData[["Date"]]<-as.Date(electricPowerData[["Date"]],"%d/%m/%Y")
  #test[["Time"]]<-as.Date(test[["Time"]],"%H:%M:%S")
  electricPowerDataSubSet<- electricPowerData[(electricPowerData[["Date"]]==as.Date("2007-02-01")| electricPowerData[["Date"]]==as.Date("2007-02-02")),]
  png(file = "plot1.png", width = 480, height = 480, units = "px")
  hist(electricPowerDataSubSet[["Global_active_power"]], col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}