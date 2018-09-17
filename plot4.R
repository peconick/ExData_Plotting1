plot4<-function(hpc=NULL){
    if (is.null(hpc)) {
        ## Read data from file
        source(paste(getwd(),"loadData.R",sep="/"))
        hpc<-getHPCData()
    }
    Sys.setenv(LANG = "en")
    plot.new()
    
    datetime<-hpc$Date+hpc$Time
    
    png(filename = "plot4.png",width = 480, height = 480, units = "px")
    
    par(mfcol=c(2,2))
    
    #plot2
    plot(datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
    
    #plot3
    plot(datetime,hpc$Sub_metering_1,col="grey",type="n",xlab="",ylab="Energy sub metering")
    points(datetime,hpc$Sub_metering_1,col="black",type="l")
    points(datetime,hpc$Sub_metering_2,col="red",type="l")
    points(datetime,hpc$Sub_metering_3,col="blue",type="l")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
    
    #voltage
    plot(datetime,hpc$Voltage,type="l",ylab="Voltage")
    
    #global reactive
    plot(datetime,hpc$Global_reactive_power,type="l")
    
    dev.off()
}
